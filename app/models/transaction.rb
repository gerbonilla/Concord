class Transaction < ApplicationRecord
  belongs_to :portfolio

  monetize :fees_cents
  monetize :fx_rate_cents
  monetize :price_cents
  monetize :value_cents
end
