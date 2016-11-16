class PhotosController < ApplicationController
  def index
    # Calls on f00px API to get 100 popular photos
    response = F00px.get('photos?feature=popular&rpp=100')
    @photos = JSON.parse(response.body)['photos']
  end
end
