# This model acts as the join model between Taggables and Tags.
class TagJoin < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag

  validates :tag, :taggable, presence: true
  validates :tag_id, uniqueness: { scope: [:taggable_id, :taggable_type] }
end
