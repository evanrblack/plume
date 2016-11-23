# This class will be the main connection between
# managers, caregivers, and clients. It can have
# suborganizations, and a superorganization.
class Organization < ApplicationRecord
  include Emailable, Organizable, Locatable, Phonable

  has_many :managers, inverse_of: :organization, dependent: :destroy
  has_many :caregivers, inverse_of: :organization, dependent: :destroy
  has_many :clients, inverse_of: :organization, dependent: :destroy
  has_many :organizations, inverse_of: :organization, dependent: :destroy

  validates :name, presence: true
end
