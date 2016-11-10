# This class represents a client as part of a group.
class Client < ApplicationRecord
  include Birthdatable, Genderable, Groupable, Locatable,
          Nameable, Phonable, Taggable
  # Messageable

  has_many :contacts, inverse_of: :client, dependent: :destroy
  has_many :shifts, inverse_of: :client, dependent: :destroy
end
