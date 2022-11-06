class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user) if user.premium_user == true
    end
  end

  def show?
    user == record.user
  end

  def create?
    user.premium_user == true
  end

  def destroy?
    return true
  end
end
