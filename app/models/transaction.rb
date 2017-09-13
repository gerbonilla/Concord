class Transaction < ApplicationRecord
  belongs_to :account

  monetize :amount_cents


  # validates :account, presence: true
  # validates :date_posted, presence: true
  # validates :status, presence: true
  # validates :description, presence: true
  # validates :source, presence: true
end
