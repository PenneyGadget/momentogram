require 'rails_helper'

describe "photo index page" do
  it "a user can see all their photos" do
    VCR.use_cassette("instagram_service#photo_index") do
      visit "/"
      click_on "Login with Instagram"

      expect(page).to have_link "My Photos"

      click_on "My Photos"
      expect(current_path).to eq(photos_path)

      expect(page).to have_css(".user-image", :visible => true)
      expect(page).to have_css(".image-info", :visible => true)
      expect(page).to have_link "Home"
    end
  end
end
