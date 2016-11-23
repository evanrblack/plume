# This concern adds functionality for belonging to an organization.
module Organizable
  extend ActiveSupport::Concern

  included do
    belongs_to :organization, inverse_of: model_name.plural.to_sym
    validates :organization, presence: true, allow_nil: true
  end
end
