# This class represents a caregiver as part of a group.
class Caregiver < ApplicationRecord
  include Birthdatable, Emailable, Genderable, Groupable, Locatable, Loginable,
          Nameable, Phonable, Schedulable, Taggable
  # Messageable

  has_many :visits, inverse_of: :caregiver, dependent: :destroy
end
