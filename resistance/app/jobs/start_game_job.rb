class StartGameJob < ApplicationJob
  queue_as :default

  def perform(data)
    payload = {
      room:           data[:room],
      testPhrase:      'this is from the start game job',
      action:         'startGame'
    }

    ActionCable.server.broadcast("game_room_#{data[:room]}_channel", payload)
  end
end