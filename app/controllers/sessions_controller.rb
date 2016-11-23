class SessionsController < ApplicationController
  def create
    # Creates a new user session using authorization given from omniauth
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    session[:token_secret] = auth.credentials.secret
    session[:token] = auth.credentials.token
    redirect_to '/'
    flash[:notice] = "Welcome, #{@user.name}!"
  end

  def destroy
    # Removes the user id, token and secret when user logs off
    if current_user
    session[:user_id] = nil
    session[:token_secret] = nil
    session[:token] = nil
    flash[:notice] = "Signed out"
    end
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
