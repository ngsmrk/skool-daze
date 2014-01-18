require_relative 'wunderground_client'

class HolidayPlannerClient < WundergroundClient

  def initialize(api_key)
    super(api_key)
  end  
  
  def planner(start_date, end_date, country, city)
    response = get_data("planner_#{format_date(start_date)}#{format_date(end_date)}/q/#{Rack::Utils.escape_path(country)}/#{Rack::Utils.escape_path(city)}.json")

    params = {start_date: start_date, end_date: end_date, country: country, city: city}

    response.params = params

    response  
  end

  private

  def format_date(date_as_str)
    date_as_array = date_as_str.split '/'

    date_as_array[0] + date_as_array[1]
  end
end