class Feed
  attr_reader :user

  def self.all_media(user)
    new(user).all_media
  end

  def initialize(user)
    @user = user
  end

  def all_media
    raw_media.flatten.sort_by { |post| -post.created_time.to_i }
  end

  private

  def raw_media
    user_ids.map do |id|
      service.friends_media(id)[:data].map { |m| build_object(m) }
    end
  end

  def service
    @service ||= InstagramService.new(user)
  end

  def user_ids
    @user_ids ||= service.user_follows[:data].map { |user| user[:id] }
  end

  def build_object(data)
    OpenStruct.new(data)
  end
end
