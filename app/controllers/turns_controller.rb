class TurnsController < ApplicationController
  def create
    @game  = Game.find(params[:game_id])
    @team  = @game.teams.find(params[:team_id])
    square = params[:square].to_i

    @team.update(position: square, on_board: true)
    @game.visit_square(square)

    if square == @game.goal_square
      @game.update(status: "finished")
      redirect_to @game, notice: "WIN:#{@team.name}"
    else
      instruction = @game.random_instruction
      @game.advance_turn
      redirect_to @game, notice: instruction
    end
  end
end
