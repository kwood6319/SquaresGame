class Game < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :turns, dependent: :destroy

  serialize :instructions, coder: JSON
  serialize :visited_squares, coder: JSON, type: Array

  def total_squares
    grid_x * grid_y
  end

  def advance_turn
    next_team = teams.order(:id).where("id > ?", current_team_id).first
    next_team ||= teams.order(:id).first
    update(current_team_id: next_team.id)
  end

  def random_instruction
    instructions.sample
  end

  def visit_square(square)
    self.visited_squares || []
    self.visited_squares << square
    save
  end

  def square_visited?(square)
    ( visited_squares || []).include?(square)
  end
end
