class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.account.profile.user == user
  end

  def update?
    record.account.profile.user == user
  end
end
