class BankPasswordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def show?
    user == record.user
  end

  def destroy?
    return true
  end

  def update?
    user == record.user
  end
end
