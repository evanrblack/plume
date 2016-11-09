# This class encapsulates all authorization for loginables.
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    return if user.nil?

    if user.manager?
      # Can read and update itself.
      can :read, Manager, id: user.id
      can :update, Manager, id: user.id

      # Can CRUD only if in same group.
      can :crud, Caregiver, group_id: user.group_id
      can :crud, Client, group_id: user.group_id
    elsif user.caregiver?
      # Can read and update itself.
      can :read, Caregiver, id: user.id
      can :update, Caregiver, id: user.id
    end
  end
end
