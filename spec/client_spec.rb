require 'spec_helper'
describe Eventbrite::Client do
  before do
    @client = Eventbrite::Client.new do |config|
      config.access_token = "asdasdasdasdas"
    end
  end
  describe "access_token" do
    it "confirms invalid token" do
      @client.access_token = nil
      expect(@client.credentials?).to be false
    end
    it "raises error when not String" do 
      @client.access_token = 123123
      expect{ @client.validate_credential_type! }.to raise_error(Eventbrite::ConfigurationError)
    end
  end
end