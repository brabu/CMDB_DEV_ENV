class RoutesController < ApplicationController
  def new
  	@route = Route.new
  end
  
  def search
  	@route = Route.includes([:source],[:destination]).where(:sid => params[:place][:sid], :did => params[:place][:did])
  	@journey = Journey.new
  	render 'search', :locals => { :jdate => params[:date]}
  end

  def create
    st = Time.new(1,1,1,params["st-h"],params["st-m"],0).to_s.split(' ')[1]
    et = Time.new(1,1,1,params["et-h"],params["et-m"],0).to_s.split(' ')[1]
    
    route = Route.new(:sid => params[:place][:sid], :did => params[:place][:did] ,:st => st ,:et => et ,:fare => params[:fare] ,:max => params[:max])
    if route.save
      flash[:notice] = "Route successfully created"
    else
      flash[:notice] = "Route creation failed"
    end
    redirect_to new_route_path
  end

  def show
    @route = Route.new
  end
end
