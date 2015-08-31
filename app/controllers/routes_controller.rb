class RoutesController < ApplicationController
  def new
  	@route = Route.new
  end
  
  def create
  	@route = Route.where(:sid => params[:place][:sid], :did => params[:place][:did]) || []
  	@journey = Journey.new
  	render 'check_availability', :locals => { :jdate => params["date"]}
  end

  def check_availability
  end
end
