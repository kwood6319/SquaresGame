class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.integer :grid_x
      t.integer :grid_y
      t.integer :goal_square
      t.string :status
      t.integer :current_team
      t.text :instructions

      t.timestamps
    end
  end
end
