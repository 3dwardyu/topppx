class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    session[:token_secret] = auth.credentials.secret
    session[:token] = auth.credentials.token
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    session[:token_secret] = nil
    session[:token] = nil
    redirect_to '/'
  end

  def failure
    redirect_to '/'
  end

  protected
  def auth
    request.env['omniauth.auth']
  end
end
