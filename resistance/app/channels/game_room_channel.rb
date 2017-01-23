# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_room_#{params[:room]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def test_route
    TestRouteJob.perform_later(room: params[:room])
  end

  def add_player
    # payload = {
    #             room: params[:room],
    #             new_player_name: Player.find(params[:player_id].name)
    # }
    # AddPlayerJob.perform_later(payload)
  end
end
