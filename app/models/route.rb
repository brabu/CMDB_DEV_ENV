class Route < ActiveRecord::Base
	belongs_to :source, :foreign_key => "sid", :class_name => "Place" 
	belongs_to :destination, :foreign_key => "did", :class_name => "Place" 
	has_many :journeys, :class_name => "Journey", :foreign_key => "routeid" 
    
    validates :fare, presence: true, numericality: {only_integer: true }
    validates :max, presence: true, numericality: {in: 1..50}

end
