require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# need to tag specs with vcr:
# it "should do stuff", :vcr do
# ...
# end

# # spec/model/your_model_spec.rb
# describe YourModel do
#   describe '#call_api&quot; do
#      it &quot;gets a response from an api&quot; do
#        VCR.use_cassette 'model/api_response' do
#           response = call_api(api_url)
#           response.first.should == &quot;hello world&quot;
#        end
#      end
#   end
# end

# When you run this test for the first time, check your spec/vcr directory.
# You will see a new directory called ‘model’, and in it will be the api_response.yml file,
# which will include the response from the api that you just called. Now, every
# time the test runs, that cassette will be used instead of making the actual api call.
