require 'rubygems'
require 'rest-client'
require 'json'
require "googlemaps_polyline/core"

module HkGeo
  class RouteFinder
    def self.route(from, to)
      response = RestClient.get("http://maps.googleapis.com/maps/api/directions/json?origin=#{from}&destination=#{to}&sensor=false")
      routes = JSON(response.to_str)
      overview_polyline = routes["routes"].first["overview_polyline"]
      puts overview_polyline.inspect
      GoogleMapsPolyline.decode_polyline(overview_polyline["points"], overview_polyline["levels"])
    end
  end
end