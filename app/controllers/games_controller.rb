class GamesController < ApplicationController
  require "csv"

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    # Parse CSV
    if params[:game][:instructions_file].present?
      file = params[:game][:instructions_file]
      instructions = CSV.read(file.path).flatten.reject(&:blank?)
      @game.instructions = instructions
    end

    if @game.save
      # Create teams
      params[:teams].each_with_index do |team_params, index|
        @game.teams.create(
          name: team_params[:name],
          colour: team_params[:colour],
          position: nil,
          on_board: false,
          entry_point: nil
        )
      end

      # Assign entry points and goal square
      GameSetupService.new(@game).call

      redirect_to @game
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:grid_x, :grid_y)
  end
end
