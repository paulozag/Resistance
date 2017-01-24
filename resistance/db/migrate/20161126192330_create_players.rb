class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string      :name
      t.boolean     :is_spy, default: false
      t.references  :user
      t.references  :game

      t.timestamps null: false
    end
  end
end
