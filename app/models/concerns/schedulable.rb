# This concern adds functionality for having a schedule.
module Schedulable
  extend ActiveSupport::Concern

  included do
    has_one :schedule, as: :schedulable, inverse_of: :schedulable,
                       dependent: :destroy

    accepts_nested_attributes_for :schedule
  end
end
