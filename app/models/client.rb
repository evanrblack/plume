# This class represents a client as part of an organization.
class Client < ApplicationRecord
  include Birthdatable, Genderable, Organizable, Locatable, Nameable, Phonable,
          Taggable
  # Messageable

  has_many :contacts, inverse_of: :client, dependent: :destroy
  has_many :tasks, inverse_of: :client, dependent: :destroy

  accepts_nested_attributes_for :tasks, reject_if: :reject_task?

  private

  def reject_task?(attributes)
    attributes['description'].blank?
  end
end
