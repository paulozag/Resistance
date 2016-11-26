class Game < ActiveRecord::Base
  has_many :missions
  has_many :players
end
