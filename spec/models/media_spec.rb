require 'rails_helper'

RSpec.describe Media, type: :model do
  it "collects proper media data" do
    params = {:image_url=>"https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/12677646_1039553569419064_1246118943_n.jpg?ig_cache_key=MTE4NzIwMTcxMTE5NzExNjM1OQ%3D%3D.2",
              :likes=>9,
              :location=>"The Moon",
              :media_id=>"1187201711197116359_269242292",
              :comments=>["This is a beautiful photo!", "troll troll troll troll you've been trolled", "#capybara"]}

    media = Media.new(params)

    expect(media.image_url).to eq("https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/12677646_1039553569419064_1246118943_n.jpg?ig_cache_key=MTE4NzIwMTcxMTE5NzExNjM1OQ%3D%3D.2")
    expect(media.likes).to eq(9)
    expect(media.location).to eq("The Moon")
    expect(media.caption).to eq("")
    expect(media.media_id).to eq("1187201711197116359_269242292")
    expect(media.comments).to eq(["This is a beautiful photo!", "troll troll troll troll you've been trolled", "#capybara"])
  end
end
