class PassengersController < ApplicationController
  def  new
  	@passenger = Passenger.new
    render 'new', :locals => { :jdate => params[:date], :routeid => params[:route], :tcount => params[params[:route]]}
  end

  def create
  	
    @journey = Journey.find_or_create_by(routeid: params[:route] ,date: params[:date])
    
    @t = Ticket.new(:journey_id => @journey.id, :user_id => current_user.id, :route_id => params[:route],:DOB => Date.today, :count => params[:count])

    params[:name].zip(params[:age]).each do |name, age|
       @t.passengers.new(:name => name, :age => age)
    end
    
    @t.save!
    
    render 'show', :locals => { :jdate => params[:date], }
  end
  
end

/
    route_id = params[:route]
    
    params = { 
      Ticket: { :journey_id => @journey.id, :user_id => current_user.id, :route_id => route_id,
        :DOB => Date.today, 
        :count => count, passengers_attributes: [
        { name: 'avd', age: 12 },{ name: 'aavd', age: 12 }
      ]
      }
    }
    @t = Ticket.new(params[:Ticket])
    count = params[:count]
    name = params[:name]
    age = params[:age]
    /
    