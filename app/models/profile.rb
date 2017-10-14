class Profile < ApplicationRecord
  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :portfolios, through: :accounts
  has_many :positions, through: :portfolios
  has_many :transactions, through: :portfolios

  # validates :user, presence: true
  # validates :address, presence: true
  # validates :transfer_pin, length: { is: 4 }, allow_nil: true

  def methods_to_implement
    # exposure_to(asset_class)
    # account_balances()
    # fees()
    # new_card(account)
    # asset_class_breakdown
    # transactions_on_date(start_date, end_date)
    # transaction_target()
  end

  def exposure_to(asset_class)
    self.positions.where(asset_class: asset_class).sum(:value_cents) / 100
  end

  def account_balances

  end

  def fees
    #how can i get mutual fund fees?
  end

  def asset_class_breakdown

  end

  def transactinons_on_date(start_date, end_date)

  end

  def transaction_target

  end


end
