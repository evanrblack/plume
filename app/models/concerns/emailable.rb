# This concern adds functionality for the validation
# of email addresses.
module Emailable
  extend ActiveSupport::Concern

  included do
    validates :email, format: { with: Devise.email_regexp }
  end
end
