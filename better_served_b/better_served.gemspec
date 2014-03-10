Gem::Specification.new do |s|
  s.name        = 'better_served'
  s.version     = '0.0.0'
  s.date        = '2014-02-18'
  s.summary     = "Provides functionality to interact with BetterServed.com"
  s.description = "Work in progress"
  s.authors     = ["Christoph Klocker"]
  s.email       = 'christoph@vedanova.com'
  s.files       = ["lib/better_served.rb"]
  s.homepage    =
      'http://www.vedanova.com'
  s.license       = ''

  #s.add_development_dependency "bourne", [">= 0"]
  s.add_runtime_dependency "pusher-client", [">= 0.4.0"]
end