class GamesController < ApplicationController
  def index
    @joinable_games = Game.joinable
    render :index
  end

  def new
    @game = Game.new
  end

  def create
    player = create_player
    @game = current_user.games.create(game_params)
    @game.player_creator_id = player.id
    @game.save
    player.game = @game
    @game.players << player

    redirect_to action: :game_room, id: @game.id, player_id: player.id
  end

  def show
    @game = Game.find(params[:id])
    @player = Player.new
  end

  def show_partial
    highlight 'in show partial'
    @team_members = Game.find(params[:id]).team
    highlight "team member count: #{@team_members.count}"
    render '_team_selection_check_box', locals: {team_members: @team_members}
  end

  def game_room
    @game = Game.find(params[:id])
    @player = Player.find(params[:player_id])
    AddPlayerJob.perform_later( room:             @game.id,
                                player_id:        @player.id,
                                new_player_name:  @player[:name])
  end

  private
  def game_params
    params.require(:game).permit(:game_name, :game_key)
  end

  def create_player
    player = current_user.players.create(name: params[:creator_nickname])
  end
end
