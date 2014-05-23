module Eventbrite
  class Error < StandardError
  end
  class ConfigurationError < ArgumentError; end
end