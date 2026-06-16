# app/services/game_setup_service.rb
class GameSetupService
  def initialize(game)
    @game = game
  end

  def call
    assign_entry_points
    assign_goal_square
  end

  private

  def assign_entry_points
    points = entry_points.shuffle
    @game.teams.each_with_index do |team, index|
      team.update(entry_point: points[index])
    end
  end

  def assign_goal_square
    # Get all entry point squares so the goal can't be on one
    occupied = @game.teams.map { |t| entry_square(t.entry_point) }
    available = (0...@game.total_squares).to_a - occupied
    @game.update(goal_square: available.sample)
  end

  def entry_points
    top    = (0...@game.grid_x).map { |i| "top-#{i}" }
    bottom = (0...@game.grid_x).map { |i| "bottom-#{i}" }
    left   = (0...@game.grid_y).map { |i| "left-#{i}" }
    right  = (0...@game.grid_y).map { |i| "right-#{i}" }

    top + bottom + left + right
  end

  def entry_square(entry_point)
    direction, index = entry_point.split("-")
    n = index.to_i

    case direction
    when "top"    then n # row 0, column n
    when "bottom" then ((@game.grid_y - 1) * @game.grid_x) + n # last row, column n
    when "left"   then n * @game.grid_x # row n, column 0
    when "right"  then (n * @game.grid_x) + (@game.grid_x - 1) # row n, last column
    end
  end
end
