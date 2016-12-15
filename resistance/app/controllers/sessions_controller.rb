class SessionsController < ApplicationController
  def new
    p "*" * 80
    p "in sessions new"
  end

  def create
    highlight params
  end

  def destroy
  end
end
