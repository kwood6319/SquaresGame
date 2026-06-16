class Game < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :turns, dependent: :destroy

  serialize :instructions, coder: JSON

  def total_squares
    grid_x * grid_y
  end
end
