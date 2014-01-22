require 'spec_helper'

describe WundergroundChanceData do
  context 'it implements the correct methods' do
    before(:all) do
      @data = WundergroundChanceData.new({"name"=>"Snow", "description"=>"desc", "percentage"=>"0"})
    end

    it 'responds to name' do
      @data.name.should eq 'Snow'
    end

    it 'responds to description' do
      @data.description.should eq 'desc'
    end

    it 'responds to percentage' do
      @data.percentage.should eq '0'
    end
    
    it 'raises an error if the method does not match a key in the hash' do
      expect { @data.non_existent_method}.to raise_error(RuntimeError)
    end

  end
end