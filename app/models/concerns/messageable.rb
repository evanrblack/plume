# This concern adds functionality for having messages.
module Messageable
  extend ActiveSupport::Concern

  included do
    has_many :messages, as: :messageable
  end
end
