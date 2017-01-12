# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def highlight msg
      p "()" * 50
      p msg
      p "()" * 50
    end
  end
end
