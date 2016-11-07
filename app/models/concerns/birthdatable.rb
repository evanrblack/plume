# This concern adds functionality for having a birthdate field.
module Birthdatable
  extend ActiveSupport::Concern

  included do
    validates :birthdate, presence: true
  end

  # age in years
  def age
    ((Time.zone.today - birthdate) / 365.25).to_i
  end
end
