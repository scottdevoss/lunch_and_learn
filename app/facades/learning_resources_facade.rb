class LearningResourcesFacade
  def initialize(country)
    @country = country
  end

  def resources
    service = LearningResourcesService.new

    json = service.resources_by_country(@country)

    Video.new(json[:items].first)
  end

  def images
    service = ImageService.new

    json = service.images_by_country(@country)

    images = json[:results].map do |image|
      Image.new(image)
    end
  end
end