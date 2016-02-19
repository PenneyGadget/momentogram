class FollowsController < ApplicationController

  def show
    @followers = InstagramService.new(current_user).user_followers[:data]
    @following = InstagramService.new(current_user).user_follows[:data]
  end

end
