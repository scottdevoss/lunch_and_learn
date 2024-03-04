require 'rails_helper'

describe CapitalService do
  context "class methods" do
    context "#get_lat_and_lon" do
      it "returns lat and lon" do
        
        search = CapitalService.new.get_lat_and_lon("India")
        
        expect(search).to be_a Array
        expect(search[0]).to be_an Hash
        expect(search[0][:latlng]).to be_an Array
      end
    end
  end
end