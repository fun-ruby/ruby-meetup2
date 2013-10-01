require 'test/unit'
require 'ruby_meetup'

class TestAuthClient < Test::Unit::TestCase

  def test_hello
    client = RubyMeetup::AuthenticatedClient.new
    assert_equal "Hello Auth World", client.hello
  end

end

