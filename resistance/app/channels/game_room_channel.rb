# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "game_room_#{params[:game_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def test
    highlight 'hit the test route'
  end
end
