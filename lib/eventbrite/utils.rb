require 'unirest'
require 'eventbrite/error'
module Eventbrite
  module Utils
    def self.get(path,headers)
      @response = Unirest.get(path,headers: headers)
      @response.body
    end

    def self.headers
      headers = {}
      headers["Authorization"] = "Bearer MW7GAPGUIC2SEKESUS7X"
      headers
    end
  end
end