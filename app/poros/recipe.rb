class Recipe
  attr_reader :id, :title, :url, :country, :image
  def initialize(country, recipe)
    @id = nil
    @title = recipe[:recipe][:label]
    @url = recipe[:recipe][:url]
    @country = country
    @image = recipe[:recipe][:image]
  end
end