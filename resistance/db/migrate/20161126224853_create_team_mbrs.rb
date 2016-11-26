class CreateTeamMbrs < ActiveRecord::Migration
  def change
    create_table :team_mbrs do |t|
      t.references :player
      t.references :team_mbrable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
