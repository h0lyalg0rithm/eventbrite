require 'faraday'
require 'json'
module Eventbrite
  class Client
    attr_accessor :token, :connection

    def initialize(options = {})
      options.each do |k,v|
        send(:"#k=", v)
      end
      yield(self) if block_given?
      validate!
      create_connection
    end

    def validate!
      if token.nil?
        raise ArgumentError , "Please provide token"
        return false
      end
      true
    end

    def create_connection
      @connection  = Faraday.new do |faraday|
                      # faraday.request  :url_encoded             
                      # faraday.response :logger                  
                      faraday.adapter  Faraday.default_adapter  
                    end
    end

    def user(user="me")
      request "https://www.eventbriteapi.com/v3/users/#{user}/"
    end

    def request(path)
      request = @connection.get(path) do |x|
        x.headers = { 'Authorization' => 'Bearer MW7GAPGUIC2SEKESUS7X'}
      end
      JSON.parse request.body
    end

    def get_user_owned_events(id)
      request "https://www.eventbriteapi.com/v3/users/#{id}/owned_events/"
    end

    def get_user_orders(id)
      request "https://www.eventbriteapi.com/v3/users/#{id}/orders/"
    end
  end
end