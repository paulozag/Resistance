class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer     :mission_number
      t.integer     :member_count
      t.boolean     :double_fail
      t.boolean     :resolved
      t.boolean     :success
      t.references  :game

      t.timestamps null: false
    end
  end
end
