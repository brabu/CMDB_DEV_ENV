class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  private
  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
