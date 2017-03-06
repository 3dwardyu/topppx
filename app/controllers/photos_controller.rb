class PhotosController < ApplicationController
  before_action :current_client

  def index
    # Calls on 500px API through f00px gem to get 100 popular photos
    response = @client.get('photos?feature=popular&rpp=100&image_size=20&nsfw=false&include_states=voted')
    @photos = JSON.parse(response.body)['photos']
  end

  def vote
    # Calls on 500px API through f00px gem to like the photo with the specified id
    @photo_id = params[:photo]
    @client.post("photos/#{@photo_id}/vote?vote=1")
    flash[:notice] = "Photo Liked!"
    redirect_to '/'
  end

  private
  # Creates multiple clients
  def current_client
    @client = F00px::Client.new
    # Checks if the current user already have a token and secret
    # If true, it'll set the current client to match the these token and secret
    if session[:token_secret] && session[:token]
      @client.token = session[:token]
      @client.token_secret = session[:token_secret]
    end
  end
end
