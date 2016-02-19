require 'rails_helper'


describe "photo show page" do
  before do
    @user = User.find_or_create_by_auth(OmniAuth.config.mock_auth[:instagram])
  end

  it "a user can see an individual page with comments" do
    VCR.use_cassette("instagram_service#photos_show") do
      service = InstagramService.new(@user)
      media = service.user_media
      second_pic = media[1].media_id

      visit "/"
      click_on "Login with Instagram"
      click_on "My Photos"
      expect(current_path).to eq(photos_path)

      page.find("#media-#{second_pic}").click
      expect(current_path).to eq(photo_path(second_pic))

      expect(page).to have_css(".image-show", :visible => true)
      expect(page).to have_css(".image-comments", :visible => true)
      expect(page).to have_content(" picture comment!!!!!!!! ")
    end
  end
end
