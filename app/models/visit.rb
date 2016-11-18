# This class represents a caregiver's visit with a client.
class Visit < ApplicationRecord
  belongs_to :caregiver, inverse_of: :visits
  belongs_to :client, inverse_of: :visits

  validates(:start_time_planned, :end_time_planned, :client, :caregiver,
            presence: true)

  def arranged?
    persisted?
  end

  def filled?
    arranged? && caregiver
  end
end
