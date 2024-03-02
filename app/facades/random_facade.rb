class RandomFacade
  def initialize
    
  end

  def country
    service = RandomService.new

    json = service.random_country
    
    Country.new(json.sample)
  end
end