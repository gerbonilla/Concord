class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :text
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
