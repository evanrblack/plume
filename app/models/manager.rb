# This class represents a manager as part of a group.
class Manager < ApplicationRecord
  include Emailable, Groupable, Loginable, Nameable, Phonable
  # Messageable

  has_many :clients, through: :group
  has_many :caregivers, through: :group
  has_many :managers, through: :group
end
