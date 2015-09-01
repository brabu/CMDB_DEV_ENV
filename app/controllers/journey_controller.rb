class JourneyController < ApplicationController

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new
    count = "count" + params["book"]
    render 'new', :locals => { :jdate => params["date"], :routeid => params["book"], :tcount => params[count]}
  end

  def booked_details
  end
end
