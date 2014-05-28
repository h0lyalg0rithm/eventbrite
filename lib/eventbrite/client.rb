require 'faraday'

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
      @connection = 
    end
  end
end