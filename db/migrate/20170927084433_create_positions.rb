class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.references :portfolio, foreign_key: true
      t.string :asset_class
      t.float :cost_basis
      t.string :cost_basis_type
      t.string :currency
      t.string :cusip
      t.float :fx_rate
      t.integer :quovo_id
      t.string :last_purchase_date
      t.float :price
      t.float :quantity
      t.string :sector
      t.string :security_type
      t.string :security_type_confidence
      t.string :ticker
      t.string :ticker_name
      t.monetize :value

      t.timestamps
    end
  end
end
