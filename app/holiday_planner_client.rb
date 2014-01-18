require_relative 'wunderground_client'

class HolidayPlannerClient < WundergroundClient

  def initialize(api_key)
    super(api_key)
  end  
  
  def planner(start_date, end_date, country, city)  
    get_data("planner_#{start_date}#{end_date}/q/#{Rack::Utils.escape_path(country)}/#{Rack::Utils.escape_path(city)}.json")
  end
  
end