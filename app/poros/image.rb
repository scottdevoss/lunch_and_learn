class Image
  attr_reader :alt_tag, :url
  def initialize(image)
    @alt_tag = image[:description]
    @url = image[:urls][:regular]
  end
end