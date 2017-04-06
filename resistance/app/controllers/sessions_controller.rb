class SessionsController < ApplicationController
  def new

  end

  def create
    highlight user_params
    p "is there a user name: #{user_params[:name]}"
    p "is there a password: #{user_params[:password]}"
    @user = User.find_by name: user_params[:name]
    unless @user && @user.password == user_params[:password]
      @errors = @user ?   ['password does not match'] :
                          ['No user by that name']
      render 'new' and return
    end
    login
    redirect_to '/games#index'
  end

  def destroy
  end

  def user_params
    params.permit(:name, :password)
  end
end
