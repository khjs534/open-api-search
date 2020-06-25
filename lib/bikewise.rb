class Bikewise
  include HTTParty
  base_uri 'www.bikewise.org/api/v2'

  def denver_thefts
    self.class.get('/incidents?page=1&per_page=200&incident_type=theft&proximity=Denver%2C CO&proximity_square=100')
  end
end
