Game.destroy_all
Player.destroy_all
Mission.destroy_all
Round.destroy_all
Vote.destroy_all
TeamMbr.destroy_all

user1     = User.create!(name: 'user1', password: 'user1')
user2     = User.create!(name: 'user2', password: 'user2')
user3     = User.create!(name: 'user3', password: 'user3')
user4     = User.create!(name: 'user4', password: 'user4')
user5     = User.create!(name: 'user5', password: 'user5')
user6     = User.create!(name: 'user6', password: 'user6')
user7     = User.create!(name: 'user7', password: 'user7')

game1 = user1.games.create!(game_name: 'user 1s game')
game2 = user2.games.create!(game_name: 'user 2s game')

player_1  = game1.players.create!( name: 'player1',
                                  user_id: user1.id)
player_2  = game1.players.create!( name: 'player2',
                                  user_id: user2.id)
player_3  = game1.players.create!( name: 'player3',
                                  user_id: user3.id)
player_4  = game1.players.create!( name: 'player4',
                                  user_id: user4.id)
player_5  = game1.players.create!( name: 'player5',
                                  user_id: user5.id)
player_6  = game1.players.create!( name: 'player6',
                                  user_id: user6.id)
player_7  = game1.players.create!( name: 'player7',
                                  user_id: user7.id)

# mission_1 = game.missions.create(   mission_number: 1,
#                                     member_count: 2,
#                                     double_fail: false,
#                                     resolved: false,
#                                     success: false)

# mission_2 = game.missions.create(   mission_number: 2,
#                                     member_count: 3,
#                                     double_fail: false,
#                                     resolved: false,
#                                     success: false)

# mission_3 = game.missions.create(   mission_number: 3,
#                                     member_count: 3,
#                                     double_fail: false,
#                                     resolved: false,
#                                     success: false)

# mission_4 = game.missions.create(   mission_number: 4,
#                                     member_count: 4,
#                                     double_fail: true,
#                                     resolved: false,
#                                     success: false)

# mission_5 = game.missions.create(   mission_number: 5,
#                                     member_count: 4,
#                                     double_fail: false,
#                                     resolved: false,
#                                     success: false)

=begin
to paste in console

game = Game.first
player_1 = Player.find(1)
player_2 = Player.find(2)
player_3 = Player.find(3)
player_4 = Player.find(4)
player_5 = Player.find(5)
player_6 = Player.find(6)
player_7 = Player.find(7)

mission_1 = Mission.find(1)
mission_2 = Mission.find(2)
mission_3 = Mission.find(3)
mission_4 = Mission.find(4)
mission_5 = Mission.find(5)

round_1 = mission_1.rounds.create(leader: player_1, is_a_go: false)
round_1.team_mbrs.create(member_id: player_1.id)
round_1.team_mbrs.create(member_id: player_2.id)
mission_1.team_mbrs.create(member_id: player_1.id)
mission_1.team_mbrs.create(member_id: player_2.id)

mission_1.votes.create(up_vote: false, voter_id: player_1.id)
round_1.votes.create(up_vote: false, voter_id: player_1.id)

=end