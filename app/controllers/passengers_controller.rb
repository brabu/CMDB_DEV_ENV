class PassengersController < ApplicationController
  def  new
  	@ticket = Ticket.new
    count = params[:ticket][:selected].to_i
    @passengers = []
    count.times { |e| @passengers << @ticket.passengers.new }
    render 'new', :locals => { :ticket => params[:ticket]}
  end

  def create
  	
    @journey = Journey.find_or_create_by(routeid: params[:ticket][:route_id] ,date: params[:ticket][:date]) 

    @t = current_user.tickets.new(ticket_params)
    @t.journey_id = @journey.id
    @t.save!

    flash[:notice] = "Ticket Booked Successfully"
    redirect_to tickets_path
  end
  
  private 
  
  def ticket_params
    params.require(:ticket).permit(:count,:journey_id, passengers_attributes: [:name, :age] )
  end
end


    /  
    @t = Ticket.new(:journey_id => @journey.id, :user_id => current_user.id, :count => params[:ticket][:count])

    params[:name].zip(params[:age]).each do |name, age|
       @t.passengers.new(:name => name, :age => age)
    end
   /