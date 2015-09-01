class PlacesController < ApplicationController

   def new
   	@place = Place.new
   end

   def create

   	p1= params["place1"].delete(' ')
   	if(p1.length > 0)
   		t = Place.where('lower(name) = ?', p1.downcase)
   		if t.blank? then 
   			Place.create(:name => p1)
   		end
    end
    p2= params["place2"].delete(' ')
   	if(p2.length > 0)
   		t = Place.where('lower(name) = ?', p2.downcase)
   		if t.blank? then 
   			Place.create(:name => p2)
   		end
    end
   end

end
