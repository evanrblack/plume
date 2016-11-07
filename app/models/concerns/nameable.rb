# This concern adds functionality for having both
# a first_name and last_name.
module Nameable
  extend ActiveSupport::Concern

  included do
    validates :first_name, :last_name, presence: true
  end

  def name
    "#{first_name} #{last_name}"
  end
end
