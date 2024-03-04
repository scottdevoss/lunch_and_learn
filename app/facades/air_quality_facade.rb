class AirQualityFacade
  def initialize(capital)
    @capital = capital
  end

  def air_quality
    service = AirQualityService.new
    json = service.air_quality_by_capital(@capital)
    AirQuality.new(json)
  end
end