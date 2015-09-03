class BookedTicketsController < ApplicationController
  def display

  end

  def new
  	
  end

  def destroy
  	 @t = Ticket.where(:id => params["ticket_id"] )
  	 if(current_user.id == @t.first.user_id)
	     @limit = params["pass_count"]
	     index = 1
	     counter = 0
	     while(index < @limit.to_f)
	     	t = "pass" + index.to_s
	     	d = params[t]
	     	if d
	     		pass_status=Passenger.find(d)
	     		pass_status.status= false;
	     		pass_status.save
	     		counter+=1
	     	end
	     	index+=1
	     end	
	     fareadd = counter * 100
	     faresub = @t.first.route.fare * counter
	     @t.first.fare = @t.first.fare - faresub + fareadd
	     @t.first.count -= counter
	     @t.first.save
	     render "show"
     else
     	render "Access"
     end
  end

  def passenger_details
  	@passenger = Passenger.new
  end
end
