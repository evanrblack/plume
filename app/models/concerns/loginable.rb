# This concern adds functionality models having a login.
module Loginable
  extend ActiveSupport::Concern

  included do
    has_one :login, as: :loginable, inverse_of: :loginable, dependent: :destroy
    validates :login, presence: true

    delegate :email, to: :login
    delegate :email=, to: :login
  end

  # Update if new user model is added
  [Manager, Caregiver].each do |klass|
    define_method "#{klass.model_name.singular}?" do
      is_a? klass
    end
  end
end
