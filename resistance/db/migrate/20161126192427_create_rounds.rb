class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.boolean     :is_a_go, default: false
      t.boolean     :resolved, default: false
      t.references  :leader
      t.references  :mission

      t.timestamps null: false
    end
  end
end
