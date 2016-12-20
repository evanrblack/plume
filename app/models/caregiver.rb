# This class represents a caregiver as part of an organization.
class Caregiver < ApplicationRecord
  include Birthdatable, Emailable, Genderable, Organizable, Locatable,
          Loginable, Nameable, Phonable, Taggable
  # Messageable
end
