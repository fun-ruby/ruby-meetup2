require 'net/http'
#
# RubyMeetup is a light-weight client for the Meetup.com API version 2.
#
# ---
# Copyright (c) 2013 Long On, released under the MIT license

module RubyMeetup

# This class is abstract. It has accessor methods for configuring
# the API site. By default it is set to https://api.meetup.com but may be changed
# using the class setter method +site=+.
#
# The gem supports API request with two authentication strategies:
# <b>API Key</b> and <b>OAuth 2</b> via the concrete classes *ApiKeyClient* and
# *AuthenticatedClient*, respectively. More information can be found in the
# specific class documentation.
#
# Example usage:
#
#  > require 'ruby_meetup'
#  > RubyMeetup::ApiKeyClient.key = 'abcd000000000000000wxyz'
#  > client = RubyMeetup::ApiKeyClient.new
#  > json_string = client.get_path("/2/groups", {:group_id => 390230})
#  > second_result = client.get({:group_id => 939203})
#
# If successful the captured response is a raw JSON string. The response can then
# be processed using a JSON parser. Otherwise an exception is raised.
#
# Typically, ApiKeyClient class is used to read data while the AuthenticatedClient
# class is used for both read and write data, subject to Meetup API permission scopes.
#
# ---
# Copyright (c) 2013 Long On, released under the MIT license

class Client
  @@site = "https://api.meetup.com"

  attr_accessor :path

  # == class methods

  # Retun the configured API endpoint
  def self.site
    @@site
  end
  # Set the global API endpoint
  def self.site=string
    @@site = string
  end

  # == instance methods

  # A convenience method to set @path and @options in the same API call.
  # Return a JSON string if successful, otherwise an Exception
  def get_path(path, options={})
    self.path = path
    get(options)
  end

  def post_path(path, options={})
    self.path = path
    post(options)
  end

  # Make a GET API call with the current path value and @options.
  # Return a JSON string if successful, otherwise an Exception
  def get(options={})
    uri = new_uri
    params = merge_params(options)
    uri.query = URI.encode_www_form(params)

    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri)
      response = http.request(request)
      unless response.is_a?(Net::HTTPSuccess)
        raise "#{response.code} #{response.message}\n#{response.body}"
      end
      return response.body
    end
  end

  def post(options={})
    uri = new_uri
    params = merge_params(options)
    uri.query = URI.encode_www_form(params)

    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Post.new(uri)
      response = http.request(request)
      unless response.is_a?(Net::HTTPSuccess)
        raise "#{response.code} #{response.message}\n#{response.body}"
      end
      return response.body
    end
  end

  # :nodoc:
  def to_s
    "#{self.class.name}: site=#{@@site}, path=#{path}"
  end


  protected
    # :nodoc:
    def initialize
      @path = ""
    end

    # :nodoc:
    def new_uri
      URI(@@site + path)
    end

    # :nodoc:
    def merge_params(options={})
      options
    end

end

end
# :nodoc:
require 'authenticated_client'
# :nodoc:
require 'api_key_client'

