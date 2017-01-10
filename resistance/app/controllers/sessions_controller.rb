class SessionsController < ApplicationController
  def new

  end

  def create
    highlight params
    @user = User.find_by name: params[:name]
    highlight('found alice') if @user
    highlight('password match') if @user.password == params[:password]
    unless @user && @user.password == params[:password]
      @errors = @user ?   ['password does not match'] :
                          ['No user by that name']
      render 'new' and return
    end
    login
    redirect_to '/games#index'
  end

  def destroy
  end
end
