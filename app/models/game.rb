class Game < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :turns, dependent: :destroy

  serialize :instructions, JSON
end
