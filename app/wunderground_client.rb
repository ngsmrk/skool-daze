require 'httparty'
require 'rack/utils'
require_relative 'wunderground_response'

class WundergroundClient
  
  include HTTParty

  attr_accessor :base_url, :api_key
  
  def initialize(base_url = 'http://api.wunderground.com/api', api_key)
    @base_url = base_url
    @api_key = api_key
  end

  def get_data(url)
    full_url = "#{@base_url}/#{api_key}/#{url}"
    puts full_url
    WundergroundResponse.new(self.class.get(full_url).parsed_response)
  end
end