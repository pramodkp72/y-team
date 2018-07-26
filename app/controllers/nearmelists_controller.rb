class NearmelistsController < ApplicationController

  def index
    # binding.pry
    lat = params[:lat]
    lng = params[:lng]

    puts lat
    puts lng
    require 'net/http'
    require 'json'
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius=1500&type=restaurant&keyword=food&key=AIzaSyCio1lbC-bpZGEb7FEcwBryRGpVlLe96LQ"
    #url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=33.4318171,-111.9063735&radius=1500&type=restaurant&keyword=food&key=AIzaSyCio1lbC-bpZGEb7FEcwBryRGpVlLe96LQ"
    uri = URI(url)
    responce = Net::HTTP.get(uri)
    places = JSON.parse(responce)

    places_list = []
    places["results"].each do |result|
      places_list.push(result["name"])
    end
    @places_list = places_list
  end
end
