class AddLevelsToPositions < ActiveRecord::Migration[5.1]
  def change
    add_column :positions, :sac1, :string
    add_column :positions, :sac2, :string
  end
end
