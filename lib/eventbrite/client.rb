require 'eventbrite/utils'
require 'eventbrite/events'
module Eventbrite
  class Client
    include Eventbrite::Utils
    include Eventbrite::Events
    attr_accessor :access_token, :debug
    ENDPOINT = 'https://www.eventbriteapi.com'

    def initialize(options = {})
      options.each do |key, value|
        send(:"#{key}=", value)
      end
      yield(self) if block_given?
      validate_credential_type!
    end
    def credentials
      {
        :token => access_token
      }
    end

    def credentials?
      credentials.values.all?
    end

    def validate_credential_type!
      credentials.each do |credential, value|
        next if value.nil?
        raise Eventbrite::ConfigurationError, "Invalid #{credential} specified: #{value.inspect} must be a string or symbol." unless value.is_a?(String) || value.is_a?(Symbol)
      end
    end
  end
end