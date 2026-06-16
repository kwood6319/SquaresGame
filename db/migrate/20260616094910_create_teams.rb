class CreateTeams < ActiveRecord::Migration[8.1]
  def change
    create_table :teams do |t|
      t.references :game, null: false, foreign_key: true
      t.string :name
      t.string :colour
      t.integer :position
      t.boolean :on_board
      t.string :entry_point

      t.timestamps
    end
  end
end
