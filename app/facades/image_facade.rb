class ImageFacade
  def initialize(country)
    @country = country
  end

  def images
    service = ImageService.new

    json = service.images_by_country(@country)

    images = json[:results].map do |image|
      Image.new(@country, image)
    end
  end
end