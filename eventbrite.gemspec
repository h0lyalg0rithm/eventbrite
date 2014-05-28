Gem::Specification.new do |s|
  s.name        = 'eventbrite'
  s.version     = '0.0.1'
  s.date        = '2014-05-24'
  s.summary     = "Eventbrite gem for ruby!"
  s.description = "Ruby gem which works with both the eventbrite api versions( 1 & 3)"
  s.authors     = ["Suraj Shirvankar"]
  s.email       = 'surajshirvankar@gmail.com'
  s.files       = ["lib/eventbrite.rb"]
  s.homepage    = 'http://rubygems.org/gems/eventbrite'
  s.license     = 'MIT'
  s.require_paths = %w[lib]
  s.add_development_dependency "bundler", "~> 1.5"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-nc"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "growl"
  s.add_development_dependency "faraday"
end