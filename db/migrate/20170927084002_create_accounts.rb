class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :brokerage_id
      t.string :brokerage_name
      t.integer :quovo_id
      t.boolean :is_inactive
      t.string :last_good_sync
      t.string :nickname
      t.string :opened
      t.references :profile, foreign_key: true
      t.monetize :value

      t.timestamps
    end
  end
end
