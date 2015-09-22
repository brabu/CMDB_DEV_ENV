class Ticket < ActiveRecord::Base
    belongs_to :journey, :class_name => "Journey" 
	belongs_to :user, :class_name => "User" 
	belongs_to :route, :class_name => "Route" 
	has_many :passengers, :class_name => "Passenger"


	before_create do
		logger.info( 'before_create ticket' )
    	self.fare = self.journey.route.fare * self.count
    	self.count_cancel = 0
  	end 

  	after_create do
  		logger.info( 'after create ticket' )
  		self.journey.booked += self.count
  		self.journey.save
  	end
end
