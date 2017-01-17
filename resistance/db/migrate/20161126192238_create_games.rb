class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :joinable, default: true
      t.boolean :playable, default: false
      t.references :creator

      t.timestamps null: false
    end
  end
end
