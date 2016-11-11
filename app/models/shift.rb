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
    pref_day = Shift.days[day]
    cur_day = (start_date.wday - 1) % 7
    diff = (pref_day - cur_day).abs
    self.start_date += pref_day < cur_day ? 7 - diff : diff
  end

  # Move end_date back to last same day.
  def adjust_end_date
    pref_day = Shift.days[day]
    cur_day = (end_date.wday - 1) % 7
    diff = (pref_day - cur_day).abs
    self.end_date -= pref_day > cur_day ? 7 - diff : diff
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
