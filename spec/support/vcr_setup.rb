VCR.configure do |c|
  # the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/cassettes'
  # your HTTP request service
  c.hook_into :webmock
  c.configure_rspec_metadata!
  # config.filter_sensitive_data('<TWITTER_KEY>') { ENV['twitter_key'] }
  # config.filter_sensitive_data('<TWITTER_SECRET>') { ENV['twitter_secret'] }
  # config.filter_sensitive_data('<USER_TOKEN>') { ENV['credentials_token'] }
  # config.filter_sensitive_data('<USER_SECRET>') { ENV['credentials_secret'] }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
