class DashboardController < ApplicationController
  
  def show
    service = InstagramService.new(current_user)
    @user_info = service.user_info
    @user_images = service.user_media
  end

end
