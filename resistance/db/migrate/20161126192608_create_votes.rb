class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean     :up_vote
      t.references  :voter
      t.references  :votable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
