class FeedController < ApplicationController

  def show
    @feed = Feed.all_media(current_user)
  end

end
