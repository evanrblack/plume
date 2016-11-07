# This concern adds functionality for belonging to a group.
module Groupable
  extend ActiveSupport::Concern

  included do
    belongs_to :group, inverse_of: model_name.plural.to_sym
    validates :group, presence: true, allow_nil: true
  end
end
