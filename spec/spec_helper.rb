require 'webmock/rspec'
require 'vcr'
require 'simplecov'
SimpleCov.start 'rails'
require 'coveralls'
Coveralls.wear!

# WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  require 'capybara/rspec'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
