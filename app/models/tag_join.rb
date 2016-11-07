# This model acts as the join model between Taggables and Tags.
class TagJoin < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag

  validates :tag, :taggable, presence: true
  validates_uniqueness_of :tag_id, scope: [:taggable_id, :taggable_type]
end
