class AirQuality
  attr_reader :aqi, :datetime
  def initialize(attrs)
    @aqi = attrs[:list][0][:main][:aqi]
    @datetime = attrs[:list][0][:dt]
  end
end