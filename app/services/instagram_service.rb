class InstagramService
  attr_reader :connection, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(:url => 'https://api.instagram.com/v1/') do |faraday|
       faraday.adapter Faraday.default_adapter
       faraday.params['access_token'] = current_user.token
     end
  end

  def user_info
    parse(connection.get("users/self/"))
  end

  def user_follows
    parse(connection.get("users/self/follows"))
  end

  def user_followers
    parse(connection.get("users/self/followed-by"))
  end

  def friends_media(friend_id)
    parse(connection.get("users/#{friend_id}/media/recent/"))
  end

  def user_media
    photos_data = parse(connection.get("users/self/media/recent/"))
    photos_data[:data].map do |photo|
      media = Media.new({image_url: photo[:images][:low_resolution][:url],
                         likes: photo[:likes][:count],
                         media_id: photo[:id],
                         comments: add_comments(photo[:id])})
      add_location(photo, media)
      add_caption(photo, media)
    end
  end

  def add_comments(media_id)
    comments = []
    parse(connection.get("media/#{media_id}/comments"))[:data].each do |comment|
      comments << comment[:text]
    end
    comments
  end

  def add_location(photo, media)
    if photo[:location]
      media.location = photo[:location][:name]
    end
    media
  end

  def add_caption(photo, media)
    if photo[:caption]
      media.caption = photo[:caption][:text]
    end
    media
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
