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
end
