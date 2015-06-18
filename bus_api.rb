require 'httparty'
require 'json'

class BusAPI
  include HTTParty
  base_url 'https://api.wmata.com/NextBusService.svc/json/jPredictions'
  
end