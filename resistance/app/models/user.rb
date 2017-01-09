class User < ApplicationRecord
  has_many :players
  has_many :games, foreign_key: :creator_id
end
