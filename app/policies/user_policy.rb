class UserPolicy < ApplicationPolicy

  def dashboard?
    is_user_the_owner_or_admin?
  end

  private

  def is_user_the_owner_or_admin?
    user == record.user || user.admin?
  end
end
