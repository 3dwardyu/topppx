class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    sessions[:user_id] = user.id
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'

  def failure
    redirect_to '/'
  end
end
