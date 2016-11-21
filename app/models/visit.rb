# This class represents a caregiver's visit with a client.
class Visit < ApplicationRecord
  belongs_to :caregiver, inverse_of: :visits
  belongs_to :client, inverse_of: :visits

  delegate :group, to: :client

  scope :filled, -> { where.not(caregiver: nil) }
  scope :unfilled, -> { where(caregiver: nil) }

  validates(:start_time_planned, :end_time_planned, :client, :caregiver,
            presence: true)

  after_create :text_caregiver

  def arranged?
    persisted?
  end

  def filled?
    arranged? && caregiver
  end

  # No handling wraparound
  def schedulize
    week_b = '0' * Schedule::DIVISIONS
    start_offset = hour_offset(start_time_planned)
    duration = (end_time_planned - start_time_planned) / 60**2
    week_b[start_offset...(start_offset + duration)] = '1' * duration
    week_b.to_i(2)
  end

  def hour_offset(t)
    offset = ((t.wday - 1) % 7) * 24 + t.hour
  end
  
  MAX_DISTANCE = 40
  def matches
    caregivers = group.caregivers
    close_caregivers = caregivers.select { |cg| available?(cg) && close_enough?(cg) }
    scored = []
    close_caregivers.each do |caregiver|
      distance_score, distance_info = score_distance(caregiver)
      tag_score, tag_info = score_tags(caregiver)
      total_score = tag_score * 0.6 + distance_score * 0.4
      scored << {
        caregiver: caregiver,
        distance_score: distance_score,
        distance_info: distance_info,
        tag_score: tag_score,
        tag_info: tag_info,
        total_score: total_score
      }
    end
    scored.sort_by { |hash| hash[:total_score] }.reverse
  end
  
  def available?(caregiver)
    caregiver_week_i = caregiver.schedule.week_i
    visit_week_i = schedulize
    visits = caregiver.visits.where(start_time_planned: [Time.zone.now.beginning_of_week..Time.zone.now.end_of_week])
    visits.each do |visit|
      caregiver_week_i = caregiver_week_i ^ visit.schedulize
    end
    visit_week_i == (visit_week_i & caregiver_week_i)
  end

  def close_enough?(caregiver)
    caregiver.distance_from(client) <= MAX_DISTANCE
  end

  def score_distance(caregiver)
    distance = caregiver.distance_from(client)
    [1 - [distance / MAX_DISTANCE, 0].max, distance]
  end

  def score_tags(caregiver)
    client_tags = client.tags
    caregiver_tags = caregiver.tags
    shared = client_tags & caregiver_tags
    missing = client_tags - caregiver_tags
    [(shared.length.to_f || 1) / (client_tags.length.to_f || 1), missing]
  end

  def to_s
    VisitsController.helpers.pretty_shift(start_time_planned..end_time_planned)
  end

  private

  def text_caregiver
    message =  "Hi #{caregiver.name}, you've been scheduled to work #{self}. Log in to plume.pw for more details."
    if Rails.env.production?
      TextJob.perform_later(caregiver.phone_number, message)
    else
      logger.debug "Texted #{caregiver.phone_number} \"#{message}\""
    end
  end
end
