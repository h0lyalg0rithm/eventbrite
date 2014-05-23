require 'spec_helper'
describe Eventbrite do
  before do
    @eventbrite = Eventbrite::Client.new do |config|
      config.access_token = "adsadasdsadsa"
    end
  end

  describe '#initialization' do
    it 'stores access_token' do
      expect(@eventbrite.access_token).to eq "adsadasdsadsa"
    end
    it 'throws error on nil token' do
      @eventbrite.access_token = nil
      expect(@eventbrite.credentials?).to eq false
    end
    it 'throws error on invalid token' do
      @eventbrite.access_token = 123123
      expect{@eventbrite.validate_credential_type!}.to raise_error
    end
  end

end