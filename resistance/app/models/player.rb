class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :votes, as: :voter

end
