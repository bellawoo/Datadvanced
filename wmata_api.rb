require 'httparty'
require 'json'

class WmataAPI
  include HTTParty
  base_url 'https://api.wmata.com/NextBusService.svc/json/jPredictions'
  
end