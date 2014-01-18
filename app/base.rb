require 'sinatra'
require 'haml'
require 'iso_country_codes'

require_relative 'wunderground_client'

get '/' do
  @countries = countries
  haml :index
end

post '/' do
  client = WundergroundClient.new('463b65ffdd4cff1c')
  @client_response = client.planner(params['start_date'], params['end_date'], params['country'], params['town_city'])
  @countries = countries

  haml :results
end

def countries
  IsoCountryCodes.for_select.sort
end