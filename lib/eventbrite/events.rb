require 'eventbrite/utils'
require 'eventbrite/client'
module Eventbrite
  module Events
    def events
      Eventbrite::Utils.get(Eventbrite::Client::ENDPOINT+'/v3/events',Eventbrite::Utils.headers)
    end
    def event(id)
      Eventbrite::Utils.get(Eventbrite::Client::ENDPOINT+"/v3/events/#{id}",Eventbrite::Utils.headers)
    end
    def event_search(term)
      Eventbrite::Utils.get(Eventbrite::Client::ENDPOINT+"/v3/events/search?q=#{term}",Eventbrite::Utils.headers)
    end
  end
end