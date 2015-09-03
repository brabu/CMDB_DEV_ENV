class PassengersController < ApplicationController
  def new
  	@passenger = Passenger.new
  end

  def create
   @journey = Journey.new
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
    amount = @r.fare * params["count"].to_f
    @t = Ticket.new(:fare => amount,:journey_id => @j.first.id, :user_id => current_user.id, :route_id => params["book"],:DOB => Date.today, :count => params["count"])
    @t.save
    index = 1 
    while(index <= params["count"].to_f)
    	a= index
    	Passenger.create(:name => params["name"+a.to_s], :age => params["age"+a.to_s], :ticket_id => @t.id, :status => true)
    	index+=1
    end
    render 'booked_details', :locals => { :jdate => params["date"], }
  end

  def show
  end
end
