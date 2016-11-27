class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "Player"
  belongs_to :voteable, polymorphic: true
end
