# This class represents a manager as part of a group.
class Manager < ApplicationRecord
  include Emailable, Groupable, Nameable, Phonable
  # Messageable

  has_one :login, as: :person, inverse_of: :person
  validates :login, presence: true

  delegate :email, to: :login
  delegate :email=, to: :login
end
