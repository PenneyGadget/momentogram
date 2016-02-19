require 'rails_helper'

describe "access dashboard from root page" do
  it "can sign user in with Instagram" do
    VCR.use_cassette("instagram_service#dashboard") do
      visit "/"
      expect(page).to have_content "Login with Instagram"

      click_on "Login with Instagram"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_link "http://www.dream-of-green.com"
      expect(page).to have_content "Followers:"
      expect(page).to have_content "Following:"
      expect(page).to have_link "Logout"
    end
  end
end
