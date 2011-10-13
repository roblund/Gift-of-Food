class HomeController < ApplicationController

  def index
    @volunteer = Volunteer.new

    if !params[:neighborhood].nil?

      @volunteer.neighborhood_id=params[:neighborhood]

    end
  end

end
