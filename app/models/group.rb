# This class will be the main connection between
# managers, caregivers, and clients. It can have
# subgroups, and a supergroup.
class Group < ApplicationRecord
  include Emailable, Groupable, Locatable, Phonable

  has_many :managers, inverse_of: :group, dependent: :destroy
  has_many :caregivers, inverse_of: :group, dependent: :destroy
  has_many :clients, inverse_of: :group, dependent: :destroy
  has_many :groups, inverse_of: :group, dependent: :destroy

  validates :name, presence: true
end
