class Game < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :turns, dependent: :destroy

  serialize :instructions, coder: JSON, type: Array
  serialize :used_instructions, coder: JSON, type: Array
  serialize :visited_squares, coder: JSON, type: Array

  def total_squares
    grid_x * grid_y
  end

  def advance_turn
    next_team = teams.order(:id).where("id > ?", current_team_id).first
    next_team ||= teams.order(:id).first
    update(current_team_id: next_team.id)
  end

  # rubocop:disable Style/RedundantSelf
  def random_instruction
    self.used_instructions ||= []
    available = instructions - used_instructions

    if available.empty?
      self.used_instructions = []
      available = instructions
    end

    instruction = available.sample
    self.used_instructions << instruction
    save
    instruction
  end
  # rubocop:enable Style/RedundantSelf

  def visit_square(square)
    visited_squares || []
    visited_squares << square
    save
  end

  def square_visited?(square)
    (visited_squares || []).include?(square)
  end
end
