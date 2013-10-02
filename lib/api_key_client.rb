module RubyMeetup

# This class is typically used to read data without needing to first obtain a
# user authenticated +access_token+. We just need a valid API Key, which any one
# can obtain directly from http://www.meetup.com
#
# The API key can be configured globally like so,
#
#  > RubyMeetup::ApiKeyClient.key = 'abcd000000000000000wxyz'
#
# Then create a new client and make a request,
#
#  > client = RubyMeetup::ApiKeyClient.new
#  > json_string = client.get_path("/2/groups", {:group_id => 390230})
# 
# The same client instance may be used to make multiple requests. Just supply a
# different @path and/or @options parameters as required.
#
# ---
# Copyright (c) 2013 Long On, released under the MIT license

class ApiKeyClient < Client
  @@key = ""

  # == class methods

  # Set the global API Key
  def self.key=string
    @@key = string
  end

  # == instance methods

  # :nodoc:
  def to_s
    s = super
    s << ", key=#{short_key}"
  end


  protected
    # :nodoc:
    def merge_params(options)
      {:sign => true, :key => @@key}.merge!(options)
    end

    # :nodoc:
    def short_key
      key = @@key
      return "" if key.nil? || key.empty?
      key[0..3] + "..." + key[(key.length - 4)..(key.length - 1)]
    end

end

end

