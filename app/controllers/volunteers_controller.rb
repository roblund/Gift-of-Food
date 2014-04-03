class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
  end

  def create
    #remove team lead from the params, if sent in
    team_lead = params[:volunteer].delete(:is_team_lead)

    @volunteer = Volunteer.create(params[:volunteer])

    #make sure we don't have any error messages before we try to assign the neighborhood
    if @volunteer.errors.messages.count == 0
      #this year, automatically make them a team lead
      @volunteer.neighborhood.team_lead = @volunteer
      @volunteer.neighborhood.save
    end

    VolunteerMailer.thank_you(@volunteer).deliver
  end

  def maps
    #look for the neighborhood url param and then set the neighborhood
    if !params[:neighborhood].nil?
      begin
        #attempt to find the neighborhood
        @hood = Neighborhood.find(params[:neighborhood])
      rescue ActiveRecord::RecordNotFound
        #no neighborhood found
        @error_message = "Sent in neighborhood not found."
      end
    else
      #no neighborhood found
      @error_message = "No neighborhood was sent in."
    end
  end

end
