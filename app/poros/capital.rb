class Capital
  attr_reader :lat, :lon
  def initialize(attrs)
    @lat = attrs[0][:capitalInfo][:latlng][0]
    @lon = attrs[0][:capitalInfo][:latlng][1]
  end
end