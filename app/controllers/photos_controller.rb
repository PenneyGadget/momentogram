class PhotosController < ApplicationController

  def index
    service = InstagramService.new(current_user)
    @user_images = service.user_media
  end

end
