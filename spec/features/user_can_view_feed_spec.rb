require 'rails_helper'

describe "photo feed" do
  before do
    @user = User.find_or_create_by_auth(OmniAuth.config.mock_auth[:instagram])
  end

  it "a user can see all their followers photos" do
    VCR.use_cassette("instagram_service#photo_feed") do
      visit "/"
      click_on "Login with Instagram"
      click_on "Photo Feed"

      expect(current_path).to eq(feed_path)

      expect(page).to have_content("Trending...")
      expect(page).to have_css(".feed-image", :visible => true)
      expect(page).to have_link "Home"
    end
  end
end
