require 'spec_helper'

describe WundergroundClient do
  
  before(:all) do
    @client = WundergroundClient.new('testkey')      
  end
  
  context 'initialisation' do
        
    it 'has a default URL' do
      @client.base_url.should eq 'http://api.wunderground.com/api'
    end
    
    it 'sets the key' do
      @client.api_key.should eq 'testkey'
    end    
  end
  
  context '#holiday_planner_info' do
    
    it 'uses the correct URL' do
      
      @client.should_receive(:get_data).with('planner_07010731/q/France/Paris.json')
      @client.holiday_planner_info('0701', '0731', 'France', 'Paris') # 1 Sep -> 31 Sep
    end
    
  end
  
end