class Mission < ActiveRecord::Base
  belongs_to :game
  has_many :rounds
  has_many :team_mbrs, as: :team_mbrable
  has_many :members, through: :team_mbrs
  has_many :votes, as: :voteable
  has_many :voters, through: :votes
end
