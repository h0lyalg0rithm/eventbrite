module Eventbrite
  class Error < StandardError
  end
  class ConfigurationError < ArgumentError; end
  class ResponseError < ArgumentError; end
end