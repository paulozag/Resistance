class AddPlayerJob < ApplicationJob
  queue_as :default

  def perform(data)
    payload = {
      room:           data[:room],
      playerId:       data[:player_id],
      newPlayerName:  data[:new_player_name],
      action:         'addPlayer'
    }

    ActionCable.server.broadcast("game_room_#{data[:room]}_channel", payload)
  end
end