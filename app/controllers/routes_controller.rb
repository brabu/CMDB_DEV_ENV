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
    @route = Route.new
    sth = params["st-h"].to_s
    if sth.length < 2
      sth = "0" + sth
    end
    eth =  params["et-h"].to_s
    if eth.length < 2
      eth = "0" + eth
    end
    etm =  params["et-m"].to_s
    if etm.length < 2
      etm = "0" + etm
    end
    stm =  params["st-m"].to_s
    if stm.length < 2
      stm = "0" + stm
    end
    st = sth + ":" + stm + ":00"
    et = eth + ":" + etm + ":00"
    r = Route.create(:sid => params[:place][:sid], :did => params[:place][:did] ,:st => st ,:et => et ,:fare => params[:fare] ,:max => params[:max])
    redirect_to 'success'
  end

  def show
    @route = Route.new
  end
end
