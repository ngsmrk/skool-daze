require_relative 'wunderground_chance_data'
require_relative 'wunderground_range'

class WundergroundResponse
  def initialize(hash)
    @hash = hash
  end
  
  def error?
    response_hash.include? 'error'
  end
  
  def error_description
    response_hash['error']['description']
  end
  
  def title
    trip_hash['title']
  end
  
  def trip_hash
    @hash['trip']
  end
  
  def cloud_cover
    trip_hash['cloud_cover']['cond'].capitalize
  end
  
  def rain_levels
    get_range 'precip'
  end
  
  def temp_low
    get_range 'temp_low'
  end

  def temp_high
    get_range 'temp_high'
  end

  private

  def get_range(key)
    WundergroundRange.new(trip_hash[key])
  end

  def response_hash
    @hash['response']
  end
end