class CapitalFacade
  def initialize(country)
    @country = country
  end

  def get_coordinates
    service = CapitalService.new

    json = service.get_lat_and_lon(@country)
    
    Capital.new(json)
  end
end