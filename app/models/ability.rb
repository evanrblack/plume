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

    # Can CRUD only if in same organization.
    can :crud, Caregiver, organization: user.organization
    can :crud, Client, organization: user.organization
  end

  def caregiver_permissions(user)
    # Can read and update itself.
    can :read, Caregiver, itself: user
    can :update, Caregiver, itself: user
  end
end
