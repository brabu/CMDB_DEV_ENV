class Journey < ActiveRecord::Base
	belongs_to :route, :foreign_key => "routeid", :class_name => "Route"
end
