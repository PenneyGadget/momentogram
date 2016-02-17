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

  def self.service
    InstagramService.new
  end

  def self.info(current_user)
    service.user_info(current_user)
  end

  def self.media(current_user)
    service.user_media(current_user)
  end

  private

  def self.build_object(data)
    OpenStruct.new(data)
  end
end
