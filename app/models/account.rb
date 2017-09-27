class Account < ApplicationRecord
  belongs_to :profile
  has_one :card
  has_many :transactions
  monetize :balance_cents

  # validates :account_number, presence: true
  # validates :account_number, uniqueness: true
  # # add length validaiton to iban
  # validates :iban, presence: true
  # # add length validation to account number

end
