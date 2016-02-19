class InstagramService
  attr_reader :connection, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(:url => 'https://api.instagram.com/v1/') do |faraday|
       faraday.adapter Faraday.default_adapter
     end
  end

  def user_info
    parse(connection.get("users/self/?access_token=#{current_user.token}"))
  end

  def user_follows
    parse(connection.get("users/self/follows?access_token=#{current_user.token}"))
  end

  def user_followers
    parse(connection.get("users/self/followed-by?access_token=#{current_user.token}"))
  end

  def find_media_object(media_id)
    parse(connection.get("media/#{media_id}?access_token=#{current_user.token}"))
  end

  def user_media
    photos_data = parse(connection.get("users/self/media/recent/?access_token=#{current_user.token}"))
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
    parse(connection.get("media/#{media_id}/comments?access_token=#{current_user.token}"))[:data].each do |comment|
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
