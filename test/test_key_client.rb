require 'test/unit'
require 'ruby_meetup'

class TestKeyClient < Test::Unit::TestCase

  def test_printing
    s = "RubyMeetup::ApiKeyClient: site=https://api.meetup.com, path="
    client = RubyMeetup::ApiKeyClient.new
    assert_equal (s + ", key="), client.to_s
    client.path = "/2/groups"
    assert_equal (s + "/2/groups, key="), client.to_s
    client.class.key = 'abcd000000000007890'
    assert_equal (s + "/2/groups, key=abcd...7890"), client.to_s
  end

end

