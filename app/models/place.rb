class Place < ActiveRecord::Base
  
  has_many :source_routes, :class_name => "Route", :foreign_key => "sid"
  has_many :destination_routes, :class_name => "Route", :foreign_key => "did"

  validates :name, presence: true
  validates :name, uniqueness: {:case_sensitive => false}

end
