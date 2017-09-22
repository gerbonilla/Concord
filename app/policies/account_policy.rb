class AccountPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.profile.user == user
  end

  def update?
    record.profile.user == user
  end
end
