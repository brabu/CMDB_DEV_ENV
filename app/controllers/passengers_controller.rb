class PassengersController < ApplicationController
  def  new
  	@passenger = Passenger.new
    count = "count" + params[:book]
    render 'new', :locals => { :jdate => params[:date], :routeid => params[:book], :tcount => params[count]}
     end

  def create
  	@journey = Journey.find_by_routeid_and_date(params[:book],params[:date])
    if @journey.nil? 
      @journey = Journey.create(:routeid => params[:book], :date => params[:date], :booked => 0)
    end

    @u = User.find(current_user.id)
    @r = Route.find(params[:book])
    @t = Ticket.new(:journey_id => @journey.id, :user_id => current_user.id, :route_id => params[:book],:DOB => Date.today, :count => params[:count])
    index = 1 
    while(index <= params[:count].to_i)
    	a= index
      t_n = "name"+a.to_s
      t_a = "age"+a.to_s
    	@t.passengers.new(:name => params[t_n], :age => params[t_a], :ticket_id => @t.id, :status => true)
    	index+=1
    end
    @t.save
    render 'show', :locals => { :jdate => params[:date], }
  end

end
