require 'sinatra'
require 'haml'
require 'titleize'
require 'iso_country_codes'

require_relative 'holiday_planner_client'

get '/' do
  @countries = countries
  haml :index
end

post '/' do
  client = HolidayPlannerClient.new('463b65ffdd4cff1c')
  @client_response = client.planner(params['start_date'], params['end_date'], params['country'], params['town_city'])
  @countries = countries

  haml :results
end

def countries
  IsoCountryCodes.for_select.sort
end