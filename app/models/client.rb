# This class represents a client as part of a group.
class Client < ApplicationRecord
  include Birthdatable, Genderable, Groupable, Locatable,
          Nameable, Phonable
  # Messageable, Taggable
end
