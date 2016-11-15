# This class represents a task to be completed during a visit.
class Task < ApplicationRecord
  belongs_to :client, inverse_of: :tasks
  has_many :checks, inverse_of: :task, dependent: :destroy

  validates :title, :client, presence: true
end
