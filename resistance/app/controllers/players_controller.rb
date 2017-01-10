class PlayersController < ApplicationController
  def new
  end

  def create
    player =  Player.create(new_player_data)
    # TODO add new player to game
    redirect_to controller: :games, action: :game_room, id: params[:game_id]
  end

  def new_player_data
    { name:       params[:player_nickname],
      user_id:    current_user.id,
      game_id:    params[:game_id] }
  end
end
