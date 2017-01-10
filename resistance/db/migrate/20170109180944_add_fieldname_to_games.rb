class AddFieldnameToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :game_name, :string
  end
end
