class Ticket < ActiveRecord::Base
  belongs_to :journey, :class_name => "Journey" 
  belongs_to :user, :class_name => "User" 
  has_many :passengers, :class_name => "Passenger"
  
  accepts_nested_attributes_for :passengers

  before_create :set_count_cancel

  validates :count, presence: true, numericality: {in: 1..50}

  before_create :calculate_fare
  
  after_create :increment_booked

  private

  def calculate_fare
    logger.info( 'before_create ticket' )
    self.fare = journey.route.fare * count
  end 

  def increment_booked
    logger.info( 'after create ticket' )
    self.journey.booked += count
    self.journey.save
  end

  def set_count_cancel
    self.count_cancel ||= 0
  end

end


