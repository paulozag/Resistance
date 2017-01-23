class PlayersController < ApplicationController
  def new
  end

  def create
    # TODO check to see if game_key is a match
    player =  Player.create(new_player_data)
    # TODO player validation
    redirect_to controller: :games, action: :game_room,
                id: params[:game_id], player_id: player.id
  end

  def new_player_data
    { name:       params[:player_nickname],
      user_id:    current_user.id,
      game_id:    params[:game_id] }
  end
end
