ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
    provider: 'instagram',
    uid: '269242292',
    info: {
      name: "Penney",
      nickname: "Gadgetry",
      email: "penney@email.com",
      image_url: "https://scontent.cdninstagram.com/t51.2885-19/10706750_852405121512571_1455045308_a.jpg",
      bio: "I climb rocks!",
      website: "http://www.dream-of-green.com",
    },
    credentials: {token: ENV["MY_TOKEN"]}
    })
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
