require 'test/unit'
require 'ruby_meetup'

class TestClient < Test::Unit::TestCase

  def test_hello
    client = RubyMeetup::Client.new
    assert_equal "Hello World", client.hello
  end

end

