class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(account: user.profile.accounts[0])
    end
  end

  def show?
    record.profile.user == user
  end

  def update?
    record.profile.user == user
  end
end
