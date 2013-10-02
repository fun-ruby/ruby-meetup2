ruby-meetup2
============

A light-weight Ruby client for working with the Meetup API.

### Requirements

  * Ruby implementation with net/http[s] support


### Install

```
  $ gem install ruby_meetup2
```

### Use with API Key

```ruby
  > require 'ruby_meetup'
  > RubyMeetup::ApiKeyClient.key = ENV['MEETUP_APIKEY']
  > client = RubyMeetup::ApiKeyClient.new
  > json_s = client.get_path("/2/groups", {:group_id => 390230})
  > # do something with json_s
```

### Use with OAuth 2 access_token

```ruby
  > client = RubyMeetup::AuthenticatedClient.new
  > client.access_token = user.access_token
  > json_s = client.get_path("/2/groups", {:member_id => user.member_id})
  > # do something with json_s
```


## License

Copyright (c) 2013 Long On, released under the MIT license

