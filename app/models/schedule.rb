# This class represents a clients required shifts or a caregivers availability
class Schedule < ApplicationRecord
  DIVISIONS = 24 * 7
  FORMAT = "%0#{DIVISIONS}b".freeze

  belongs_to :schedulable, polymorphic: true, inverse_of: :schedule

  validates :schedulable, presence: true
  validates :week, numericality: { only_integer: true }

  # To create visits, need to convert to datetime range
  # Walk back from start point
  # Keep track of start point, prevent loop (both ways)
  # To handle wraparound at end of week (sunday night -> monday morning)
  # No need to worry about it now for the demo.

  # TODO: Work with wraparound
  # TODO: Lower line count
  def shifts_i
    shifts = []
    start = nil
    week_b.chars.each_with_index do |v, i|
      if start.nil? && v == '1'
        start = i
      elsif start && (v == '0')
        shifts << [start, (i - start)]
        start = nil
      end
    end

    # Handle ones at end
    shifts << [start, (DIVISIONS - start)] if start

    shifts
  end

  # TODO: Lower ABC size
  def shifts_dt
    sow = Time.zone.now.beginning_of_week
    shifts_i.map do |s, d|
      start_time = sow + s.hours
      start_time += 1.week if start_time < Time.zone.now
      start_time..(start_time + d.hours)
    end.sort_by(&:min)
  end

  def visits
    shifts_dt.map do |range|
      schedulable.visits.find_or_initialize_by(start_time_planned: range.min,
                                               end_time_planned: range.max)
    end
  end

  def week_i
    week.to_i
  end

  def week_b
    if week.present?
      format(FORMAT, week)
    else
      '0' * DIVISIONS
    end
  end

  def week_b=(value)
    return unless value && /[[:digit:]]{#{DIVISIONS}}/.match(value)
    self.week = value.to_i(2)
  end
end
