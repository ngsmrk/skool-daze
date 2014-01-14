require 'httparty'
require_relative 'wunderground_response'

class WundergroundClient
  
  include HTTParty

  attr_accessor :base_url, :api_key
  
  def initialize(base_url = 'http://api.wunderground.com/api', api_key)
    @base_url = base_url
    @api_key = api_key
  end
  
  def planner(start_date, end_date, country, city)  
    get_data("planner_#{start_date}#{end_date}/q/#{country}/#{city}.json")
  end

  private 

  def get_data(url)
    full_url = "#{@base_url}/#{api_key}/#{url}"
    puts full_url
    WundergroundResponse.new(self.class.get(full_url).parsed_response)
  end
end