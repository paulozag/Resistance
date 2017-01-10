class GamesController < ApplicationController
  def index
    @joinable_games = Game.joinable
    render :index
  end

  def new
    @game = Game.new
  end

  def create
    player = create_player
    @game = current_user.games.create(game_params)
    player.game = @game
    @game.players << player

    redirect_to game_path(id: @game.id)
  end

  def show
    @game = Game.find(params[:id])
  end

  private
  def game_params
    params.require(:game).permit(:game_name, :game_key)
  end

  def create_player
    player = current_user.players.create(name: params[:creator_nickname])
  end
end
