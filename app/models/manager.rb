# This class represents a manager as part of an organization.
class Manager < ApplicationRecord
  include Emailable, Organizable, Loginable, Nameable, Phonable
  # Messageable

  has_many :clients, through: :organization
  has_many :caregivers, through: :organization
  has_many :managers, through: :organization
end
