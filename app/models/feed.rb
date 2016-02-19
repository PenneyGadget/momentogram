class Feed

  def self.all_media(current_user)
    service = InstagramService.new(current_user)
    user_ids = service.user_follows[:data].map { |user| user[:id] }
    all_media = user_ids.map do |id|
      service.friends_media(id)[:data].map { |m| build_object(m) }
    end
    all_media.flatten.sort_by { |post| -post.created_time.to_i }
  end

  private

  def self.build_object(data)
    OpenStruct.new(data)
  end
end
