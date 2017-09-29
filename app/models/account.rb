class Account < ApplicationRecord
  belongs_to :profile
  has_many :portfolios, dependent: :destroy

  monetize :value_cents
end
