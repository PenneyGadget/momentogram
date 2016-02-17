class User < ActiveRecord::Base

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"])

    user.nickname = auth["info"]["nickname"]
    user.name = auth["info"]["name"]
    user.email = auth["info"]["email"]
    user.image_url = auth["info"]["image"]
    user.bio = auth["info"]["bio"]
    user.website_url = auth["info"]["website"]
    user.token = auth["credentials"]["token"]

    user.save
    user
  end

  # def service
  #   InstagramService.new(self)
  # end
  #
  # def info
  #   service.user_info
  # end
  #
  # def media
  #   service.user_media
  # end
  #
  # private
  #
  # def build_object(data)
  #   OpenStruct.new(data)
  # end
end
