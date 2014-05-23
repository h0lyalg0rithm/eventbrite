module Eventbrite
  class Client
    attr_accessor :access_token, :debug, :host
    def initialize(options = {})
      @host = "eventbrite.com"
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