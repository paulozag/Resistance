Game.destroy_all
Player.destroy_all
Mission.destroy_all
Round.destroy_all
Vote.destroy_all
TeamMbr.destroy_all


game = Game.create
player_1 = game.players.create(name: 'player1', is_spy: true)
player_2 = game.players.create(name: 'player2', is_spy: true)
player_3 = game.players.create(name: 'player3', is_spy: true)
player_4 = game.players.create(name: 'player4', is_spy: false)
player_5 = game.players.create(name: 'player5', is_spy: false)
player_6 = game.players.create(name: 'player6', is_spy: false)
player_7 = game.players.create(name: 'player7', is_spy: false)

mission_1 = game.missions.create(   mission_number: 1,
                                    member_count: 2,
                                    double_fail: false,
                                    resolved: false,
                                    success: false)

mission_2 = game.missions.create(   mission_number: 2,
                                    member_count: 3,
                                    double_fail: false,
                                    resolved: false,
                                    success: false)

mission_3 = game.missions.create(   mission_number: 3,
                                    member_count: 3,
                                    double_fail: false,
                                    resolved: false,
                                    success: false)

mission_4 = game.missions.create(   mission_number: 4,
                                    member_count: 4,
                                    double_fail: true,
                                    resolved: false,
                                    success: false)

mission_5 = game.missions.create(   mission_number: 5,
                                    member_count: 4,
                                    double_fail: false,
                                    resolved: false,
                                    success: false)

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