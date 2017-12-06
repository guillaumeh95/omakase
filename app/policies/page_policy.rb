class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def home?
    return true
  end

end
