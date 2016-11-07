# This class will be the main connection between
# managers, caregivers, and clients. It can have
# subgroups, and a supergroup.
class Group < ApplicationRecord
  include Emailable, Groupable, Locatable, Phonable

  belongs_to :group, inverse_of: :group

  has_many :managers, inverse_of: :group
  has_many :caregivers, inverse_of: :group
  has_many :clients, inverse_of: :group
  has_many :groups, inverse_of: :group

  validates :name, presence: true
end
