class TeamMbr < ActiveRecord::Base
  belongs_to :player
  belongs_to :team_mbrable, polymorphic: true
end
