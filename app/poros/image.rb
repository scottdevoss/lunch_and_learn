class Image
  def initialize(country, image)
    @alt_tag = image[:description]
    @url = image[:urls][:regular]
    require 'pry'; binding.pry
  end
end