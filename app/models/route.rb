class Route < ActiveRecord::Base
	belongs_to :source, :foreign_key => "sid", :class_name => "Place" do
  		def name
    		select(:name)
    	end
   	end
	belongs_to :destination, :foreign_key => "did", :class_name => "Place" do
  	def name
    	select(:name)
    end
   end
	has_many :journeys, :class_name => "Journey", :foreign_key => "routeid" do
  	 def booked
     	select(:booked)
     end
    end
    
    validates :fare, presence: true, numericality: {only_integer: true }
    validates :max, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50}
end
