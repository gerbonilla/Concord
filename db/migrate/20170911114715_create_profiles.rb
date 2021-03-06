class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :transfer_pin
      t.string :language
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
