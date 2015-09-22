class BookedTicketsController < ApplicationController
#TicketsController - Naming conv

  def destroy
  	#Find user's tickets.....
  	#pass array of cancellation from UI
  	 @t = Ticket.find_by_id_and_user_id(params[:ticket_id],current_user.id)
	 @arr = params[:pass]
	 counter = 0
	 if !@arr.nil?
		 @arr.each do |a|   
			 @passenger=Passenger.find_by_id_and_ticket_id(a,@t.id)
			 if !@passenger.nil? 
				@passenger.status= false;
		     	@passenger.save
		     	counter+=1
		 	 end
		 end
	 end
     cancel_charge = counter * 100
	 fare_to_refund = (@t.route.fare * counter) - cancel_charge
	 @t.fare = @t.fare - fare_to_refund
	 @t.count_cancel += counter
	 @t.save
	 render 'index'
  end
  
  def index

  end

  def show
  	@passenger = Passenger.new
  end

end
