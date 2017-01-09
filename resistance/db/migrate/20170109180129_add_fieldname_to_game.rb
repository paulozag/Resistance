class AddFieldnameToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :creator_id, :integer
  end
end
