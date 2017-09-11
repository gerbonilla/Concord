class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :transfer_pin
      t.string :language

      t.timestamps
    end
  end
end
