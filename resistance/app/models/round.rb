class Round < ActiveRecord::Base
  belongs_to :leader, class_name: :Player
  belongs_to :mission
  has_many :team_mbrs, as: :team_mbrable
  has_many :members, through: :team_mbrs
  has_many :votes, as: :voteable
  has_many :voters, through: :votes
  scope :completed_rounds, -> { where(resolved: true)}
end
