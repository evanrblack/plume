# This class represents a client as part of a group.
class Client < ApplicationRecord
  include Birthdatable, Genderable, Groupable, Locatable, Nameable, Phonable,
          Schedulable, Taggable
  # Messageable

  has_many :contacts, inverse_of: :client, dependent: :destroy
  has_many :tasks, inverse_of: :client, dependent: :destroy
  has_many :checks, through: :tasks
  has_many :visits, inverse_of: :client, dependent: :destroy

  accepts_nested_attributes_for :tasks, reject_if: :reject_task?

  private

  def reject_task?(attributes)
    attributes['description'].blank?
  end
end
