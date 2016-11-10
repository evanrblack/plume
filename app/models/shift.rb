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

  private

  def no_overlap
  end
end
