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

end