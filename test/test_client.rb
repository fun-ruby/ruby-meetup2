require 'test/unit'
require 'ruby_meetup'

class TestClient < Test::Unit::TestCase

  def test_site_accessor
    old_site = RubyMeetup::Client.site
    RubyMeetup::Client.site = "https://api.test.com"
    assert_equal "https://api.test.com", RubyMeetup::Client.site
    RubyMeetup::Client.site = old_site
    assert_equal old_site, RubyMeetup::Client.site
  end

  def test_path_accessor
    client = RubyMeetup::Client.new
    assert_equal "", client.path
    client.path = "/2/groups"
    assert_equal "/2/groups", client.path
  end

  def test_printing
    s = "RubyMeetup::Client: site=https://api.meetup.com, path="
    client = RubyMeetup::Client.new
    assert_equal s, client.to_s
    client.path = "/2/groups"
    assert_equal (s + "/2/groups"), client.to_s
  end

end

