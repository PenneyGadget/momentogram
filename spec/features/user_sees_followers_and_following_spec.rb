require 'rails_helper'

describe "followers and following index page" do
  before do
    @user = User.find_or_create_by_auth(OmniAuth.config.mock_auth[:instagram])
  end

  it "a user can see all their followers and those they follow" do
    VCR.use_cassette("instagram_service#follow_index") do
      visit "/"
      click_on "Login with Instagram"
      click_on "Followers"

      expect(current_path).to eq(follows_path)

      expect(page).to have_content("#{@user.nickname} is following:")
      expect(page).to have_content("#{@user.nickname} is followed by:")

      expect(page).to have_css(".peeps", :visible => true)
      expect(page).to have_link "Home"
    end
  end
end
