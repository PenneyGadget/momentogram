class InstagramService
  attr_reader :connection, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(:url => 'https://api.instagram.com/v1/') do |faraday|
       faraday.request :url_encoded
       faraday.response :logger
       faraday.adapter Faraday.default_adapter
     end
  end

  def user_info
    parse(connection.get("users/self/?access_token=#{current_user.token}"))
  end

  def user_media
    photos_data = parse(connection.get("users/self/media/recent/?access_token=#{current_user.token}"))
    photos_data[:data].map do |photo|
      media = Media.new({image_url: photo[:images][:low_resolution][:url],
                 likes: photo[:likes][:count]})
      add_location(photo, media)
      add_caption(photo, media)
    end
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
