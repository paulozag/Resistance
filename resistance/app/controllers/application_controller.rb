class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def highlight *values
    p "*" * 80
    values.each {|val| p val}
    p "*" * 80
  end

  def helper_test
    highlight "paul"
  end

  def login
    session[:user_id] = @user.user_id
  end

  def log_out
    session[:user_id] = nil
  end


end
