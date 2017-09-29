class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :portfolio, foreign_key: true
      t.string :currency
      t.string :cusip
      t.string :date
      t.string :expense_category
      t.monetize :fees
      t.monetize :fx_rate
      t.integer :quovo_id
      t.boolean :is_cancel
      t.boolean :is_pending
      t.string :memo
      t.monetize :price
      t.float :quantity
      t.string :ticker
      t.string :ticker_name
      t.string :tran_category
      t.string :tran_type
      t.monetize :value

      t.timestamps
    end
  end
end
