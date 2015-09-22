class BookedTicketsController < ApplicationController
#TicketsController - Naming conv

  def destroy
  	#Find user's tickets.....
  	#pass array of cancellation from UI
  	 @u = User.find(current_user.id)
  	 @t = @u.Tickets.find(params[:ticket_id])
	 @arr = params[:pass]
	 if !@arr.nil?
		 @arr.each do |a|   
			 @passenger=@t.passengers.find(a)
			 if !@passenger.nil? 
				@passenger.status = false;
				@passenger.save
		 	 end
		 end
	 end
	 render 'index'
  end
  
  def index
  	@t= Ticket.order(id: :desc).where(:user_id => current_user) || []
  end

  def show
  	@passenger = Passenger.new
  end

end
