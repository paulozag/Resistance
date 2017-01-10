class AddGameKeyToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :game_key, :string
  end
end
