class Ticket < ActiveRecord::Base
    belongs_to :journey, :class_name => "Journey" 
	belongs_to :user, :class_name => "User" 
	belongs_to :route, :class_name => "Route" 
	has_many :passengers, :class_name => "Passenger"
end
