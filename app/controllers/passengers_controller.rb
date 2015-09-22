class PassengersController < ApplicationController
  def  new
  	@passenger = Passenger.new
    count = "count" + params[:book]
    render 'new', :locals => { :jdate => params[:date], :routeid => params[:book], :tcount => params[count]}
     end

  def create
  	@journey = Journey.find_by_routeid_and_date(params[:book],params[:date])
    if @journey.nil? then
      @journey = Journey.create(:routeid => params[:book], :date => params[:date], :booked => params[:count].to_f)
    else
      @journey.booked = @journey.booked + params[:count].to_f
      @journey.save
    end

    @u = User.find(current_user.id)
    @r = Route.find(params[:book])
    amount = @r.fare * params[:count].to_f
    @t = Ticket.new(:fare => amount,:journey_id => @journey.id, :user_id => current_user.id, :route_id => params[:book],:DOB => Date.today, :count => params[:count], :count_cancel => 0)
    @t.save
    index = 1 
    while(index <= params[:count].to_f)
    	a= index
      t_n = "name"+a.to_s
      t_a = "age"+a.to_s
    	Passenger.create(:name => params[t_n], :age => params[t_a], :ticket_id => @t.id, :status => true)
    	index+=1
    end
    render 'show', :locals => { :jdate => params[:date], }
  end

end
