class RecipeFacade
  def initialize(country)
    @country = country
  end

  def recipes
    service = RecipeService.new

    json = service.recipes_by_country(@country)

    recipes = json[:hits].map do |recipe|
      Recipe.new(@country, recipe)
    end
  end
end