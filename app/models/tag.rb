# This model adds support for tagging things for matching purposes.
class Tag < ApplicationRecord
  enum category: [:health, :environment, :task]

  validates :name, presence: true
  validates :category, inclusion: { in: Tag.categories.keys }

  # destroy only joins, not tagged model
  has_many :tag_joins, inverse_of: :tag, dependent: :destroy

  # Set up for any taggable model.
  [Caregiver, Client].each do |klass|
    plural = klass.model_name.plural.to_sym
    singular = klass.model_name.name
    has_many plural, through: :tag_joins, source: :taggable,
                     source_type: singular, inverse_of: :tags
  end
end
