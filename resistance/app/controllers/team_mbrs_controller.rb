class TeamMbrsController < ApplicationController
  def create
    highlight "#{params}"
  end
end
