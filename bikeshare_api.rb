require 'httparty'
require 'xml'

class BikeAPI
  include HTTParty
  base_url 'https://www.capitalbikeshare.com/data/stations/bikeStations.xml'
  
end