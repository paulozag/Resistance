class CreateGames < ActiveRecord::Migration
  def change
    create_table  :games do |t|
      t.boolean     :joinable, default: true
      t.string      :stage
      t.references  :creator

      t.timestamps null: false
    end
  end
end
