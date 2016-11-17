class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  # Checks if there is an exisiting sessions, otherwise it'll set it to one that was just created
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
