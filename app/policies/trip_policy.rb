class TripPolicy < ApplicationPolicy

  def new?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def edit?
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
