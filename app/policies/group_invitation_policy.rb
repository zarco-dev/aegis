class GroupInvitationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # @group_invitation = GroupInvitation.where("group_id =?", user)
      # @all_groups = GroupInvitation.all
     scope.all
    end
  end

  def index?
    return true
  end

  def create?
    return true
  end
end
