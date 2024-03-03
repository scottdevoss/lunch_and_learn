require "rails_helper"

describe LearningResourcesService do
  context "class methods" do
    context "#resources_by_country" do
      xit "returns youtube resources by country", :vcr do

        search = LearningResourcesService.new.resources_by_country("laos")
        
        expect(search).to be_a(Hash)
        expect(search[:items]).to be_a(Array)

        video = search[:items].first

        expect(video).to be_a(Hash)
        expect(video).to have_key(:id)
        expect(video[:id][:videoId]).to be_a(String)

        expect(video).to have_key(:snippet)
        expect(video[:snippet]).to have_key(:title)
        expect(video[:snippet][:title]).to be_a(String)

        expect(video[:snippet]).to have_key(:channelId)
        expect(video[:snippet][:channelId]).to be_a(String)
      end
    end
  end
end
        
