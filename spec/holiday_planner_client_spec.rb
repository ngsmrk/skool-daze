require 'spec_helper'

describe HolidayPlannerClient do

  before(:all) do
    @client = HolidayPlannerClient.new('testkey')
  end

  context '#planner' do
    it 'uses the correct URL' do
      
      @client.should_receive(:get_data).with('planner_12011231/q/France/Paris.json').and_return(WundergroundResponse.new({}))
      @client.planner('12/01/2014', '12/31/2014', 'France', 'Paris')
    end
  end

end