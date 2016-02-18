class PhotosController < ApplicationController

  def index
    @images = InstagramService.new(current_user).user_media
  end

  def show
    @image = InstagramService.new(current_user).find_media_object(params[:id])
  end

end
