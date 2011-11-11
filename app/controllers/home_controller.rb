class HomeController < ApplicationController

  def index

    @volunteer = Volunteer.new

    #look for the neighborhood url param and then preset the neighborhood
    if !params[:neighborhood].nil?
      begin
        #attempt to find the neighborhood
        hood = Neighborhood.find(params[:neighborhood])
      rescue ActiveRecord::RecordNotFound
        #no neighborhood found
        @error_message = "Sent in neighborhood not found."
      else
        #if it is found set the volunteer's neighborhood
        @volunteer.neighborhood_id = params[:neighborhood]
      end
    end

    # 26/130 volunteers = 20% to our goal.
    @volCount = Volunteer.all.count
    @volPercent = @volCount/130

  end

end
