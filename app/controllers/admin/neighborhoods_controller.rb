class Admin::NeighborhoodsController < ApplicationController

  if Rails.env.production?
    http_basic_authenticate_with :name => ENV['GOF_USERNAME'], :password => ENV['GOF_SECRET']
  else
    http_basic_authenticate_with :name => "frodo", :password => "thering"
  end

  def index
    @neighborhoods = Neighborhood.all.order(:region, :name, :drop_location)
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.create(neighborhood_params)
    redirect_to admin_neighborhoods_url
  end
  
  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name,:region,:drop_location)
  end

end
