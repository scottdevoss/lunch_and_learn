class Country
  attr_reader :name
  def initialize(country)
    @name = country[:name][:common]
  end
end