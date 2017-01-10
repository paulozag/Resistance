class PlayersController < ApplicationController
  def new
  end

  def create
    p '&*&' *25
    p params

    player =  Player.create(
      name:       params[:player_nickname],
      user_id:    current_user.id,
      game_id:    params[:game_id])
  end
end
