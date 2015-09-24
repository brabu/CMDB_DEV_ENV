class Journey < ActiveRecord::Base
	belongs_to :route, :foreign_key => "routeid", :class_name => "Route"

	  before_create :set_availability

	  def set_availability
	  		self.booked=0
	  end
end
