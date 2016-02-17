class InstagramService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => 'https://api.instagram.com/v1/') do |faraday|
       faraday.request :url_encoded
       faraday.response :logger
       faraday.adapter Faraday.default_adapter
     end
  end

  def user_info(current_user)
    parse(connection.get("users/self/?access_token=#{current_user.token}"))
  end

  def user_media(current_user)
    parse(connection.get("users/self/media/recent/?access_token=#{current_user.token}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
