require 'spec_helper'

describe WundergroundResponse do
  context 'invalid response' do
    before(:all) do
      @error_response_hash = {"response"=>{"version"=>"0.1", "termsofService"=>"tos", "features"=>{}, "error"=>{"type"=>"keynotfound", "description"=>"this key does not exist"}}}
      
      @response = WundergroundResponse.new(@error_response_hash)
    end
  
    it 'has an error' do
      @response.error?.should be_true
    end
    
    it 'has an error' do
      @response.error_description.should eq 'this key does not exist'
    end    
  end
end