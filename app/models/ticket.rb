class Ticket < ActiveRecord::Base
  belongs_to :journey, :class_name => "Journey" 
	belongs_to :user, :class_name => "User" 
	belongs_to :route, :class_name => "Route" 
	has_many :passengers, :class_name => "Passenger"
  accepts_nested_attributes_for :passengers

  validates :count, presence: true, numericality: {in: 1..50}
 
  before_validation :set_count_cancel
  before_create :fare_calculation
  after_create :count_increase

	  def fare_calculation
		logger.info( 'before_create ticket' )
    	self.fare = journey.route.fare * count
    end 

  	def count_increase
  		logger.info( 'after create ticket' )
  		self.journey.booked += count
  		self.journey.save
  	end

    def set_count_cancel
        if self.count_cancel.nil?
          self.count_cancel=0
        end
    end

end


