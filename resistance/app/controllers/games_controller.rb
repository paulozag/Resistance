class GamesController < ApplicationController
  def index
    @joinable_games = Game.joinable
    render :index
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to game_path(id: @game.id)
  end

  def show
    "in game show"
  end

  private
  def game_params
    params.require(:game).permit(:game_name, :game_key)
  end
end
