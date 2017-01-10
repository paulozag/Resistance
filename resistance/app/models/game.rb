class Game < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :missions
  has_many :players
  scope :joinable, -> { where(joinable: true) }

  def player_count
    @player_count ||= self.players.count
  end

  def create_missions

    (1..5).each do |mission_number|
      # self.missions.create(generate_mission_parameters(mission_number))
      p generate_mission_parameters(mission_number)
    end
  end


  private
  def mission_hash
     {
          5 => {  mission_1: {  member_count: 2, double_fail: false},
                  mission_2: {  member_count: 3, double_fail: false},
                  mission_3: {  member_count: 2, double_fail: false},
                  mission_4: {  member_count: 3, double_fail: false},
                  mission_5: {  member_count: 3, double_fail: false}
               },
          6 => {  mission_1: {  member_count: 2, double_fail: false},
                  mission_2: {  member_count: 3, double_fail: false},
                  mission_3: {  member_count: 4, double_fail: false},
                  mission_4: {  member_count: 3, double_fail: false},
                  mission_5: {  member_count: 4, double_fail: false}
               },
          7 => {  mission_1: {  member_count: 2, double_fail: false},
                  mission_2: {  member_count: 3, double_fail: false},
                  mission_3: {  member_count: 3, double_fail: false},
                  mission_4: {  member_count: 4, double_fail: true},
                  mission_5: {  member_count: 4, double_fail: false}
               },
          8 => {  mission_1: {  member_count: 3, double_fail: false},
                  mission_2: {  member_count: 4, double_fail: false},
                  mission_3: {  member_count: 4, double_fail: false},
                  mission_4: {  member_count: 5, double_fail: true},
                  mission_5: {  member_count: 5, double_fail: false}
               },
          9 => {  mission_1: {  member_count: 3, double_fail: false},
                  mission_2: {  member_count: 4, double_fail: false},
                  mission_3: {  member_count: 4, double_fail: false},
                  mission_4: {  member_count: 5, double_fail: true},
                  mission_5: {  member_count: 5, double_fail: false}
               },
          10 => {  mission_1: {  member_count: 3, double_fail: false},
                   mission_2: {  member_count: 4, double_fail: false},
                   mission_3: {  member_count: 4, double_fail: false},
                   mission_4: {  member_count: 5, double_fail: true},
                   mission_5: {  member_count: 5, double_fail: false}
                }
      }
  end

  def generate_mission_parameters(mission_number)
    base_mission_parameters = { resolved: false, success: false}
    mission_specific_parameters = generate_mission_specific_parameters(mission_number)

    base_mission_parameters.merge(mission_specific_parameters)
  end

  def generate_mission_specific_parameters(mission_number)
    mission_number_key = ('mission_' + mission_number.to_s).to_sym
    mission_number_kv = {mission_number: mission_number}
    mission_hash[player_count][mission_number_key].merge(mission_number_kv)
  end
end
