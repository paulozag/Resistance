class CreateGames < ActiveRecord::Migration
  def change
    create_table  :games do |t|
      t.boolean     :joinable, default: true
      t.string      :stage, default: 'waiting_to_start'
      t.references  :creator
      t.integer     :player_creator_id

      t.timestamps null: false
    end
  end
end
