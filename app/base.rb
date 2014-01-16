require 'sinatra'
require 'haml'

require_relative 'wunderground_client'

get '/' do
  haml :index
end

post '/' do
  client = WundergroundClient.new('463b65ffdd4cff1c')
  @client_response = client.planner(params['start_date'], params['end_date'], params['country'], params['town_city'])

  haml :results
end