require 'test/unit'
require 'ruby_meetup'

class TestAuthClient < Test::Unit::TestCase

  def test_printing
    s = "RubyMeetup::AuthenticatedClient: site=https://api.meetup.com, path="
    client = RubyMeetup::AuthenticatedClient.new
    assert_equal (s + ", access_token="), client.to_s
    client.path = "/2/groups"
    assert_equal (s + "/2/groups, access_token="), client.to_s
    client.access_token = 'abcd000000000007890'
    assert_equal (s + "/2/groups, access_token=abcd...7890"), client.to_s
  end

end

