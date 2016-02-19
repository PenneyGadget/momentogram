require 'rails_helper'

describe "photo show page" do
  it "a user can see an individual page with comments" do
    VCR.use_cassette("instagram_service#photo_show") do
      visit "/"
      click_on "Login with Instagram"
      click_on "My Photos"
      click_on photos??
      # expect(current_path).to eq(photo_path(photo))
      #
      # expect(page).to have_css(".image-show", :visible => true)
      # expect(page).to have_css(".image-comments", :visible => true)
      # expect(page).to have_content(" troll troll troll troll you've been trolled ")
    end
  end
end
