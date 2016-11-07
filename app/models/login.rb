# This is the model that is attached to the user personas.
# It is the bare devise minimum, plus something to connect
# it to the associated user persona, whether its a manager
# or a caregiver.
class Login < ApplicationRecord
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable,
         :confirmable

  belongs_to :loginable, polymorphic: true, inverse_of: :login
end
