class Passenger < ActiveRecord::Base
	belongs_to :ticket, :class_name => "Ticket", :dependent => :destroy  
end
