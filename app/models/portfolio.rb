class Portfolio < ApplicationRecord
  belongs_to :account
  has_many :transactions, dependent: :destroy
  has_many :positions, dependent: :destroy

  monetize :value_cents
end
