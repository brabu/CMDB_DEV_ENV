class Passenger < ActiveRecord::Base
	belongs_to :ticket, :class_name => "Ticket", :dependent => :destroy 

	after_update do
		logger.info( 'before update passenger' )
    	self.ticket.count_cancel+=1
    	self.ticket.journey.booked -=1
    	amount_to_refund = self.ticket.route.fare - 100
    	self.ticket.fare -= amount_to_refund
    	self.ticket.save
    	self.ticket.journey.save
  	end 
end
