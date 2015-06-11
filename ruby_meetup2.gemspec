Gem::Specification.new do |s|
  s.name        = 'ruby_meetup2'
  s.version     = '0.6.0'
  s.date        = '2015-06-11'
  s.summary     = "Meetup API v2 Ruby client"
  s.description = "A light-weight Ruby client for working with the Meetup API"
  s.authors     = ["Long On", "github.com/domicode"]
  s.email       = 'on.long.on@gmail.com'
  s.files       = ["lib/ruby_meetup.rb",
                  "lib/api_key_client.rb",
                  "lib/authenticated_client.rb"
                  ]
  s.requirements << "ruby net/http[s]"
  s.homepage    = 'https://github.com/fun-ruby/ruby-meetup2'
  s.has_rdoc    = true
  s.license     = 'MIT'
end
