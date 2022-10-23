class GroupInvitationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # @group_invitation = GroupInvitation.where("group_id =?", user)
      # @all_groups = GroupInvitation.all
      @group_invitation = GroupInvitation.group_id
      raise
    end
  end

  def index?
    return true
  end

  def create?
    return true
  end
end
