# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    highlight "in subscribe with origin: game_room_#{params[:room]}"
    stream_from "game_room_#{params[:room]}_channel"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def test_route
    ActionCable.server.broadcast("game_room_#{params[:room]}_channel", message: 'back on client side')
    p "TEST ROUTE PARAMS: #{params}"
    highlight "hit the route for game_room_#{params[:room]}"
    TestRouteJob.perform_later(room: params[:room])
  end
end
