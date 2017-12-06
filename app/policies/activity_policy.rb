class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    is_user_the_owner_or_admin?
  end

  def create?
    is_user_the_owner_or_admin?
  end

  def update?
    is_user_the_owner_or_admin?
  end

  def destroy?
    is_user_the_owner_or_admin?
  end

  private

  def is_user_the_owner_or_admin?
    user == record.user || user.admin?
  end
end
