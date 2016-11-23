# This class represents a task to be completed during a visit.
class Task < ApplicationRecord
  belongs_to :client, inverse_of: :tasks

  validates :description, :client, presence: true

  attr_accessor :_remove
  before_validation :remove, if: :_remove

  scope(:active, lambda do |time = Time.zone.now|
    where('? >= created_at AND (removed_at IS NULL OR ? < removed_at)',
          time, time)
  end)

  # This lets the change of the virtual attribute run validations.
  def _remove=(value)
    removed_at_will_change!
    @_remove = value
  end

  def remove
    self.removed_at = Time.zone.now
  end

  def active?(time = Time.zone.now)
    time >= created_at && (removed_at.nil? || time < removed_at)
  end
end
