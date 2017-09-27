class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.date :date_posted
      t.string :status
      t.references :account, foreign_key: true
      t.integer :amount_cents, default: 0
      t.string :description
      t.string :source

      t.timestamps
    end
  end
end
