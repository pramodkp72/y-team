class PlacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user, only: [:show]
  #list all places
  def index
    @places = Place.all
  end

  def new
    @categories = Category.where(cat_type: 'Place')
  end

  #create place
  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to @place
  end

  #show single
  def show
    @place_comment = PlaceComment.new
    @place_comments = PlaceComment.all
    @place = Place.find(params[:id])
    puts @place.id
    @category = Category.find(@place.cat_id)
  end

  #creates new place. no error checking yet.
  private
  def place_params
    params.require(:place).permit(:name, :lat, :lng, :image_uri, :description, :cat_id, :address)
  end
end
