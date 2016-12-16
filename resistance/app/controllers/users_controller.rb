class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p params[:user]
    @user = User.create(user_params)
    #TODO validate uniqueness of name for users
    login
    redirect_to 'games#index'
  end

  private
  def user_params
    params.require(:user).permit(:name, :age)
  end

end
