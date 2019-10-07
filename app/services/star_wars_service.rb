require 'rest-client'
require 'json'

module StarWarsService
  def self.get_star_wars_characters
    response = RestClient.get('https://swapi.co/api/people')
    results = JSON.parse(response.body)
    results['results']
  end
end