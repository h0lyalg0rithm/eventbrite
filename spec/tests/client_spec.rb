require 'spec_helper'
describe Eventbrite::Client do
  before do
    @client = Eventbrite::Client.new do |config|
                config.token = "adsdsdasd"
              end
  end
  it { @client.should respond_to :token }
  it { @client.should respond_to :connection }
  describe "#new" do
    it 'returns object with credentials' do
      expect(@client.token).to eq "adsdsdasd"
    end
    it 'doesnt allow invalid config' do
      expect(@client.validate!).to eq true
    end
    it 'doesnt allow nil token' do
      @client.token = nil
      expect{ @client.validate! }.to raise_error ArgumentError
    end
  end
  describe 'creates a connection object' do
    it 'is valid' do
      expect(@client.connection).to be_kind_of Faraday::Connection
    end
  end
end