class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :account, foreign_key: true
      t.string :card_number
      t.integer :cvv
      t.date :expiration
      t.boolean :locked, default: true
      t.integer :pin

      t.timestamps
    end
  end
end
