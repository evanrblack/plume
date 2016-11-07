# This concern adds functionality for having tags.
module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tag_joins, as: :taggable, inverse_of: :taggable
    has_many :tags, through: :tag_joins, inverse_of: model_name.plural.to_sym
  end
end
