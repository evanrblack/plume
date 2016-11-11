# This class represents the archetype for visits.
class Shift < ApplicationRecord
  enum day: [:monday, :tuesday, :wednesday, :thursday,
             :friday, :saturday, :sunday]

  belongs_to :client, inverse_of: :shifts
  validates :client, presence: true

  MINUTES_PER_DAY = 1440
  MINUTES_PER_WEEK = MINUTES_PER_DAY * 7
  validates :start_time, inclusion: { in: 0..MINUTES_PER_DAY }
  validates :duration, inclusion: { in: 0..MINUTES_PER_WEEK }

  before_validation :adjust_start_date
  before_validation :adjust_end_date, if: :end_date
  validate :end_date_greater_than_start_date

  # Overlapping shifts may be a feature...?
  # validate :wont_overlap

  def split
  end

  private

  # Move start_date up to first same day.
  def adjust_start_date
    prefDay = Shift.days[self.day]
    curDay = (start_date.wday - 1) % 7
    diff = (prefDay - curDay).abs
    if prefDay < curDay
      self.start_date += 7 - diff
    else
      self.start_date += diff
    end
  end

  # Move end_date back to last same day.
  def adjust_end_date
    prefDay = Shift.days[self.day]
    curDay = (end_date.wday - 1) % 7
    diff = (prefDay - curDay).abs
    if prefDay > curDay
      self.end_date -= (7 - diff)
    else
      self.end_date -= diff
    end
  end

  def end_date_greater_than_start_date
    return if end_date.nil? || end_date >= start_date
    errors.add(:end_date, 'must be greater than start date')
  end

  def wont_overlap
    # 1D collision detection
    # First check for collision by dates, then compare week.
  end
end
