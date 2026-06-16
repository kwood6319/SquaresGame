class AddVisitedSquaresToGames < ActiveRecord::Migration[8.1]
  def change
    add_column :games, :visited_squares, :text
  end
end
