class PasswordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user == record.user
  end

  def create?
    return true
  end

  def destroy?
    return true
  end

  def update?
    user == record.user
  end
end
