class TicketsController < ApplicationController

  before_filter :load_ticket, :only => [:cancel_passenger, :show]

  def cancel_passenger
     passenger = load_ticket.passengers.where(["id in (?)", params[:pass]])
     passenger.each { |psngr| psngr.cancel }
     flash[:notice] = "#{passenger.size} Passenger(s) Cancelled Successfully"
	   redirect_to tickets_path
  end
  
  def index
  	@t= current_user.tickets.order(id: :desc) || [] 
  end

  def show
    @passengers = load_ticket.passengers
  end

  private

  def load_ticket
    current_user.tickets.find_by_id(params[:id]) || (raise ActiveRecord::RecordNotFound) 
  end
end
