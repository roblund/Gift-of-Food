class HomeController < ApplicationController

  def index
    @volunteer = Volunteer.new
    #look for the neighborhood url param and then preset the neighborhood
    if !params[:neighborhood].nil?
      @volunteer.neighborhood_id=params[:neighborhood]
    end
  end

end
