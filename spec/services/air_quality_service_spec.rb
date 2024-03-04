require 'rails_helper'

describe AirQualityService do
  context "class methods" do
    context "#air_quality_by_capital" do
      it "returns air quality by capital" do

        capital = CapitalFacade.new("India").get_coordinates
        
        search = AirQualityService.new.air_quality_by_capital(capital)
    
        expect(search).to be_a Hash
        expect(search[:coord]).to be_an Hash
        expect(search[:list]).to be_an Array
        expect(search[:list][0]).to be_an Hash
        expect(search[:list][0][:main]).to be_an Hash
      end
    end
  end
end