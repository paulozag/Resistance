class Game < ActiveRecord::Base
  has_many :missions
  has_many :players

  MISSION_HASH  = {
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
