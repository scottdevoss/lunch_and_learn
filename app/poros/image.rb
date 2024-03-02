class Image
  attr_reader :alt_tag, :url
  def initialize(country, image)
    @alt_tag = image[:description]
    @url = image[:urls][:regular]
  end
end