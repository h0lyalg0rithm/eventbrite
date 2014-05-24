require 'spec_helper'
require 'unirest'
require 'json'

describe Eventbrite::Events do
  before do
    @client = Eventbrite::Client.new do |config|
      config.access_token = "asdasdasdasdasdsad"
    end
  end
  describe "#events" do
    before do
      @client = double()
      @client.stub(:events){ f = File.read(File.expand_path('../fixtures', __FILE__)+ '/events.json');JSON.load(f) }
    end
    it "get hash" do
      expect(@client.events.class).to eq Hash
    end
  end
  describe "#event" do
    before do
      @client = double()
      @client.stub(:event){ f = File.read(File.expand_path('../fixtures', __FILE__)+ '/event.json');JSON.load(f) }
    end
    it "returns hash" do
      expect(@client.event(1).class).to eq Hash
    end
  end
  describe "#event" do
    before do
      @client = double()
      @client.stub(:event_search){ f = File.read(File.expand_path('../fixtures', __FILE__)+ '/event_search.json');JSON.load(f) }
    end
    it "returns hash" do
      expect(@client.event_search("sh").class).to eq Hash
    end
  end
end