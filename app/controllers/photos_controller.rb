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

  end

  private
  def current_client
    @client = F00px::Client.new
    if session[:token_secret] && session[:token]
      @client.token = session[:token]
      @client.token_secret = session[:token_secret]
    end
  end
end
