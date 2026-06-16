class AddUsedInstructionsToGames < ActiveRecord::Migration[8.1]
  def change
    add_column :games, :used_instructions, :text
  end
end
