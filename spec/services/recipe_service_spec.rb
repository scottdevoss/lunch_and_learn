require "rails_helper"

describe RecipeService do
  context "class methods" do
    context "#recipes_by_country" do
      it "returns all recipes by country" do
        search = RecipeService.new.recipes_by_country("thailand")
        expect(search).to be_a(Hash)
        expect(search[:hits]).to be_a(Array)

        recipe = search[:hits].first

        expect(recipe).to be_a(Hash)
        expect(recipe).to have_key(:recipe)
        expect(recipe[:recipe]).to have_key(:label)
        expect(recipe[:recipe][:label]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:image)
        expect(recipe[:recipe][:image]).to be_a(String)
      end
    end
  end
end