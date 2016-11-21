# This class encapsulates all authorization for loginables.
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    return if user.nil?
    send("#{user.model_name.singular}_permissions", user)
  end

  def manager_permissions(user)
    # Can read and update itself.
    can :read, Manager, itself: user
    can :update, Manager, itself: user

    # Can CRUD only if in same group.
    can :crud, Caregiver, group: user.group
    can :crud, Client, group: user.group
    can :crud, Visit
  end

  def caregiver_permissions(user)
    # Can read and update itself.
    can :read, Caregiver, itself: user
    can :update, Caregiver, itself: user

    # Can update its visits.
    can :update, Visit, caregiver: user
  end
end
