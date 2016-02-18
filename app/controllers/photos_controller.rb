class PhotosController < ApplicationController

  def index
    @images = InstagramService.new(current_user).user_media
  end

end
