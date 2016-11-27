class TeamMbr < ActiveRecord::Base
  belongs_to :member, class_name: "Player"
  belongs_to :team_mbrable, polymorphic: true
end
