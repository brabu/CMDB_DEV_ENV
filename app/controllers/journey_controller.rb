class JourneyController < ApplicationController

  def new
  	@journey = Journey.new
  end

  def create
  	@journey = Journey.where(:routeid => params["book"], :date => params["date"]) || []
  	if @journey.blank? then
  		Journey.create(:routeid => params["book"], :date => params["date"], :booked => 1)
  	else
  		@journey.first.booked = @journey.first.booked + 1
  		@journey.first.save
  	end
    @j = Journey.where(:routeid => params["book"], :date => params["date"])
    @u = User.find(current_user.id)
    @r = Route.find(params["book"])
    Ticket.create(:journey_id => @j.first.id, :user_id => current_user.id, :route_id => params["book"],:DOB => Date.today)
  	render 'booked_details', :locals => { :jdate => params["date"] }
  end

  def booked_details
  end
end
