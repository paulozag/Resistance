class AddPlayerJob < ApplicationJob
  queue_as :default

  def perform(data)
    game = Game.find(data[:room])
    payload = {
      room:           data[:room],
      playerId:       data[:player_id],
      isPlayable:     game.playable?,
      creatorId:       game.player_creator_id,
      newPlayerName:  data[:new_player_name],
      action:         'addPlayer'
    }

    ActionCable.server.broadcast("game_room_#{data[:room]}_channel", payload)
  end
end