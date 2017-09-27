class Card < ApplicationRecord
  belongs_to :account

  # validates :account, presence: true
  # validates :card_number, presence: true
  # validates :card_number, uniqueness: true
  # # add length validation to card number
  # validates :cvv, presence: true, length: { is: 3 }
  # # add validations for


end
