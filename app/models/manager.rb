# This class represents a manager as part of a group.
class Manager < ApplicationRecord
  include Emailable, Groupable, Loginable, Nameable, Phonable
  # Messageable
end
