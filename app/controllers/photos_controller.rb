class PhotosController < ApplicationController
  before_action :current_client

  def index
    # Calls on f00px API to get 100 popular photos
    response = @client.get('photos?feature=popular&rpp=100')
    @photos = JSON.parse(response.body)['photos']
  end

def vote
    @photo_id = params[:photo]
    @client.post("photos/#{@photo_id}/vote?vote=1")
    redirect_to '/'
  end

  private
  def current_client
    @client = F00px::Client.new
    if session[:secret] && session[:token]
      @client.token = session[:token]
      @client.token_secret = session[:secret]
    end
  end
end
