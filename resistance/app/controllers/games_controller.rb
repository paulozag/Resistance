class GamesController < ApplicationController
  def index
    @joinable_games = Game.joinable
    render :index
  end

  def new
    @game = Game.new
  end

  def create
  end
end
