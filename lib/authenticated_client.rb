module RubyMeetup

# This class can be used to read and write data on behalf of an authenticated user.
# An <b>OAuth 2</b> +access_token+ is given once user is authenticated. One of the
# methods is to use the +ominauth-meetup+ gem.
#
# An +access_token+ is user-specific so we configure it per Client instance like so,
#
#  > client = RubyMeetup::AuthenticatedClient.new
#  > client.access_token = user.access_token
#
# Then make a request,
#
#  > json_string = client.get_path("/2/groups", {:member_id => user.member_id})
#
# The same client instance may be used to make multiple requests. Just supply a
# different @path and/or @options parameters as required.
#
# ---
# Copyright (c) 2013 Long On, released under the MIT license

class AuthenticatedClient < Client

  attr_accessor :access_token

  # == instance methods

  # Make a POST API call with the current path value and @options.
  # Return a JSON string if successful, otherwise an Exception
  #   TODO - test AuthenticatedClient.post()
  def post(options)
    uri = new_uri
    params = merge_params(options)
    response = Net::HTTP.post_form(uri, params)
    unless response.is_a?(Net::HTTPSuccess)
      raise "#{response.code} #{response.message}\n#{response.body}"
    end
    response.body
  end

  # Fake a PUT API call since meetup.com only support POST method
  #   TODO - test AuthenticatedClient.put()
  def put(options)
    post(options)
  end

  # Make a DELETE API call with the current path value and @options.
  # Return true if successful, otherwise an Exception
  #   TODO - test AuthenticatedClient.delete()
  def delete(options={})
    uri = new_uri
    params = merge_params(options)
    uri.query = URI.encode_www_form(params)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Delete.new(uri) # uri or uri.request_uri?
    response = http.request(request)
    unless response.is_a?(Net::HTTPSuccess)
      raise "#{response.code} #{response.message}\n#{response.body}"
    end
    true
  end

  # :nodoc:
  def to_s
    s = super
    s << ", access_token=#{short_token}"
  end


  protected
    # :nodoc:
    def initialize
      super
      @access_token = ""
    end

    # :nodoc:
    def merge_params(options)
      {:access_token => access_token}.merge!(options)
    end

    # :nodoc:
    def short_token
      return "" if access_token.nil? || access_token.empty?
      access_token[0..3] + "..." +
        access_token[(access_token.length - 4)..(access_token.length - 1)]
    end

end

end

