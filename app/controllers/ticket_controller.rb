class TicketController < ApplicationController

  def destroy

  	 t = current_user.tickets.find(params[:id])
     cancelled = t.passengers.where(["id in (?)", params[:pass]])
     cancelled.each { |psngr| psngr.cancel }
	   redirect_to '/ticket'

  end
  
  def index

  	@t= Ticket.order(id: :desc).where(:user_id => current_user) || [] 
  
  end

  def show
  
    @passenger = Passenger.new
    ticket = current_user.tickets.find(params[:id])
    raise ActiveRecord::RecordNotFound unless ticket
    @passengers = ticket.passengers
  
  end

end
