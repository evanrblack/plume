# This class represents a caregiver as part of a group.
class Caregiver < ApplicationRecord
  include Birthdatable, Emailable, Genderable, Groupable,
          Locatable, Nameable, Phonable
  # Messageable, Taggable

  has_one :login, as: :person, inverse_of: :person
  validates :login, presence: true

  delegate :email, to: :login
  delegate :email=, to: :login
end
