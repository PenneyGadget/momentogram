class PhotosController < ApplicationController

  def index
    @images = InstagramService.new(current_user).user_media
  end

  def show
    user_media = InstagramService.new(current_user).user_media

    image_hash = user_media.select { |photo| photo.media_id == params[:id] }
    @image = image_hash.map { |image| image.image_url }[0]

    picture = user_media.select { |pic| pic.media_id == params[:id] }
    @comments = picture.map { |c| c.comments }.flatten
  end

end
