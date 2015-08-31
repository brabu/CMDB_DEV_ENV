class Route < ActiveRecord::Base
	belongs_to :source, :foreign_key => "sid", :class_name => "Place", :dependent => :destroy  do
  		def name
    		select(:name)
    	end
   	end
	belongs_to :destination, :foreign_key => "did", :class_name => "Place", :dependent => :destroy do
  	def name
    	select(:name)
    end
   end
	has_many :journeys, :class_name => "Journey", :foreign_key => "routeid" do
  	 def booked
     	select(:booked)
     end
    end
end
