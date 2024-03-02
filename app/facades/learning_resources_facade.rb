class LearningResourcesFacade
  def initialize(country)
    @country = country
  end

  def resources
    service = LearningResourcesService.new

    json = service.resources_by_country(@country)

    Video.new(@country, json[:items].first)
  end
end