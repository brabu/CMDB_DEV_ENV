class Ticket < ActiveRecord::Base
    belongs_to :journey, :class_name => "Journey", :dependent => :destroy  
	belongs_to :user, :class_name => "User", :dependent => :destroy 
	belongs_to :route, :class_name => "Route" 
end
