class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.references :profile, foreign_key: true
      t.integer :account_number
      t.integer :balance_cents, default: 0
      t.string :iban

      t.timestamps
    end
  end
end
