require 'rails_helper'

RSpec.describe User, type: :model do
  it "collects proper user data" do
    user = User.find_or_create_by_auth(OmniAuth.config.mock_auth[:instagram])

    expect(user.name).to eq("Penney")
    expect(user.nickname).to eq("Gadgetry")
    expect(user.email).to eq("penney@email.com")
    expect(user.website_url).to eq("http://www.dream-of-green.com")
    expect(user.token).to_not eq(nil)
  end
end
