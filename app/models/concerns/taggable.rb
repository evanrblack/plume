# This concern adds functionality for having tags.
module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tags, through: :tag_joins, as: :taggable, uniq: true
  end
end
