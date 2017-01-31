class StartGameJob < ApplicationJob
  queue_as :default

  def perform(data)
    payload = data
    ActionCable.server.broadcast("game_room_#{data[:room]}_channel", payload)
  end
end