class RoutesController < ApplicationController

  def new
  	@route = Route.new
  end

  def search
  	@routes = Route.includes([:source],[:destination]).where(:sid => params[:route][:sid], :did => params[:route][:did])
  	render 'search', :locals => { :jdate => params[:route][:date]}
  end

  def create
    route = Route.new(route_params)

    if route.save
      flash[:notice] = "Route successfully created"
    else
      flash[:notice] = Route.errors.full_messages
    end
    redirect_to new_route_path
  end

  def index
    @routes = Route.all
  end

  private

  def route_params
    params.require(:route).permit(:sid,:did,:st,:et,:fare,:max)
  end
 
end
