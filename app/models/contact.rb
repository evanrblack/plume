# This model represents a client's point of contact.
class Contact < ApplicationRecord
  include Emailable, Nameable, Phonable

  belongs_to :client, inverse_of: :contacts
  validates :client, presence: true
end
