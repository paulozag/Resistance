class GamesController < ApplicationController
  def index
    @joinable_games = Game.joinable
    highlight 'in index controller'
  end
end
