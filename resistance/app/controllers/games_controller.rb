class GamesController < ApplicationController
  def index
    @joinable_games = Games.joinable

  end
end
