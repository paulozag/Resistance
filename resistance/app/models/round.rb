class Round < ActiveRecord::Base
  belongs_to :leader, class_name: :Player
  belongs_to :mission
  has_many :team_mbrs, as: :team_mbrable
  has_many :members, class_name: :Player, through: :team_mbrs
end
