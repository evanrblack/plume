# This concern adds functionality models having a login.
module Loginable
  extend ActiveSupport::Concern

  included do
    has_one :login, as: :loginable, inverse_of: :loginable
    validates :login, presence: true

    delegate :email, to: :login
    delegate :email=, to: :login
  end
end
