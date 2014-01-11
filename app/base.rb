require 'sinatra'
require 'haml'
require 'httparty'

require_relative 'wunderground_client'

get '/' do
    client = WundergroundClient.new('463b65ffdd4cff1c')
    response = client.holiday_planner_info('0701', '0731', 'France', 'Paris')
    puts response.keys

    haml :index
end