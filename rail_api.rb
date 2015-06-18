require 'httparty'
require 'json'

class RailAPI
  include HTTParty
  base_url 'https://api.wmata.com/StationPrediction.svc/json/GetPrediction'
  
end