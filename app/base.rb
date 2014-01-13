require 'sinatra'
require 'haml'
require 'httparty'

require_relative 'wunderground_client'

get '/' do
  haml :index
end

post '/' do
  client = WundergroundClient.new('463b65ffdd4cff1c')
  response = client.holiday_planner_info(params['start_date'], params['end_date'], params['country'], params['town_city'])
  @title = response['trip']['title']
  puts @title

  haml :index  
end