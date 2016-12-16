class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by name: params[:name]
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
