class Profile < ApplicationRecord
  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :portfolios, through: :accounts
  has_many :positions, through: :portfolios

  # validates :user, presence: true
  # validates :address, presence: true
  # validates :transfer_pin, length: { is: 4 }, allow_nil: true

  # # Need to add all KYC and required opening docs

end
