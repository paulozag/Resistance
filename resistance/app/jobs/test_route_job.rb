class TestRouteJob < ApplicationJob
  queue_as :default

  def perform(data)
    payload = {
      message: 'back on the client side'
    }
    p "in test route job with data: #{data[:room]}"

    ActionCable.server.broadcast("game_room_#{data[:room]}_channel", payload)
  end
end
