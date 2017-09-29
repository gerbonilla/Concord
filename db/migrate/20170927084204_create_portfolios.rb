class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.references :account, foreign_key: true
      t.string :brokerage_name
      t.string :description
      t.integer :quovo_id
      t.boolean :is_inactive
      t.boolean :is_taxable
      t.string :last_change
      t.string :nickname
      t.string :owner_type
      t.string :portfolio_category
      t.string :portfolio_name
      t.string :portfolio_type
      t.string :portfolio_type_confidence
      t.monetize :value

      t.timestamps
    end
  end
end
