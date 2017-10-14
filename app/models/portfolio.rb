class Portfolio < ApplicationRecord
  belongs_to :account
  belongs_to :profile, optional: true
  has_many :transactions, dependent: :destroy
  has_many :positions, dependent: :destroy

  monetize :value_cents

  def  total_value_cents
    total_cents = 0
    self.positions.each { |position| total_cents += position.value_cents}
    return total_cents
  end

end

