class DashboardController < ApplicationController

  def show
    @user_info = InstagramService.new(current_user).user_info
  end

end
