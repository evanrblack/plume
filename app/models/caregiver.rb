# This class represents a caregiver as part of a group.
class Caregiver < ApplicationRecord
  include Birthdatable, Emailable, Genderable, Groupable, Locatable, Loginable,
          Nameable, Phonable, Schedulable, Taggable
  # Messageable
end
