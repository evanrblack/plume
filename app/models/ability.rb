# This class encapsulates all authorization for loginables.
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    return if user.nil?

    if user.manager?
      can :crud, Caregiver, group_id: user.group_id
      can :crud, Client, group_id: user.group_id
    elsif user.caregiver?
      can :crud, Caregiver, id: user.id
      # can :read, Client if
    end
  end
end
