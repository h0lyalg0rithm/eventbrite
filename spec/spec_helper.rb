require 'eventbrite'
# require 'webmock/rspec'
def fixture
  File.new(fixture_path + '/' + file)
end

def stub_get(path)
  stub_request(:get, Eventbrite::Client::ENDPOINT + path)
end