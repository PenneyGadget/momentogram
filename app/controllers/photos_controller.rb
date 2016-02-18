class PhotosController < ApplicationController

  def index
    @images = InstagramService.new(current_user).user_media
  end

  def show
    image_hash = InstagramService.new(current_user).find_media_object(params[:id])
    @image = image_hash[:data][:images][:low_resolution][:url]
  end

end
