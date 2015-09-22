class PlacesController < ApplicationController

   def new
   	@place = Place.new
   end

   def create

   	p1= params["place1"]
    p1 = p1.downcase;
   	if(p1.length > 0)
   		t = Place.where('lower(name) = ?', p1)
   		if t.blank? then 
        p1 = p1.slice(0,1).capitalize + p1.slice(1..-1)
   			Place.create(:name => p1)
   		end
    end
    p2= params["place2"]
    p2.downcase
   	if(p2.length > 0)
   		t = Place.where('lower(name) = ?', p2)
   		if t.blank? then 
        p2 = p2.slice(0,1).capitalize + p2.slice(1..-1)
   			Place.create(:name => p2)
   		end
    end
   end

end
