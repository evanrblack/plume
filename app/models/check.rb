# This class represents the completion of a task during a visit.
class Check < ApplicationRecord
  belongs_to :task, inverse_of: :checks
  # belongs_to :visit, inverse_of: :checks

  # validates :task, :visit, presence: true
  validates :task, presence: true
end
