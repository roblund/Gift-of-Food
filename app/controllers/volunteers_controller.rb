class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
  end

  def create
    #remove team lead from the params, if sent in
    team_lead = params[:volunteer].delete(:is_team_lead)
    @volunteer = Volunteer.create(params[:volunteer])

    #this year, automatically make them a team lead
    @volunteer.neighborhood.team_lead = @volunteer
    @volunteer.neighborhood.save
  end

end
