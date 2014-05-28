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
  describe 'user' do
    it 'gets details' do
      expect(@client.user(1)).to be_kind_of Hash
    end
    it 'returns correct details' do
      expect(@client.user(62663903135)['id']).to eq "62663903135"
    end
    it 'own details' do
      expect(@client.user).to be_kind_of Hash
    end
    context 'owned events' do
      before do
        @response = @client.get_user_owned_events(62663903135)
      end
      it 'returns a Hash' do
        expect(@response).to be_kind_of Hash
      end
      it 'contains events array' do
        expect(@response['events']).to be_kind_of Array
      end
    end
    context 'orders' do
      before do
        @response = @client.get_user_orders(62663903135)
      end
      it 'returns hash' do
        expect(@response).to be_kind_of Hash
      end
      it 'contains orders array' do
        expect(@response['orders']).to be_kind_of Array
      end
    end
    context 'owned event orders' do
      before do
        @response = @client.get_user_owned_events_orders(62663903135)
      end
      it 'returns hash' do
        expect(@response).to be_kind_of Hash
      end
      it 'contains orders array' do
        expect(@response['orders']).to be_kind_of Array
      end
    end
    context 'owned event orders attendees' do
      before do
        @response = @client.get_user_owned_events_attendees(62663903135)
      end
      it 'returns hash' do
        expect(@response).to be_kind_of Hash
      end
      it 'contains attendees array' do
        expect(@response['attendees']).to be_kind_of Array
      end
    end
    describe 'venues' do
      before do
        @response = @client.get_user_venues(62663903135)
      end
      it 'returns hash' do
        expect(@response).to be_kind_of Hash
      end
      it 'contains venues array' do
        expect(@response['venues']).to be_kind_of Array
      end
    end
    describe 'organizers' do
      before do
        @response = @client.get_user_organizers(62663903135)
      end
      it 'returns hash' do
        expect(@response).to be_kind_of Hash
      end
      it 'contains organizers array' do
        expect(@response['organizers']).to be_kind_of Array
      end
    end
  end
end