# The class all models inherit from.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
