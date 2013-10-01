require 'test/unit'
require 'ruby_meetup'

class TestKeyClient < Test::Unit::TestCase

  def test_hello
    client = RubyMeetup::ApiKeyClient.new
    assert_equal "Hello API World", client.hello
  end

end

