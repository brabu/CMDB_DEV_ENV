class PlacesController < ApplicationController

   def new
   	@place = Place.new
   end

   def create
   	place = Place.new(place_params)
    if place.save
      flash[:notice] = "Place #{place.name} successfully created"
    else
      flash[:notice] = place.errors.full_messages
    end
    redirect_to new_place_path
   end

   def index
    @place = Place.all
   end

  private

  def place_params
    params.require(:place).permit(:name)
  end

end
