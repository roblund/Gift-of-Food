class VolunteersController < ApplicationController
  
  def new
    @volunteer = Volunteer.new
  end

  def create
    team_lead = params[:volunteer].delete(:is_team_lead)
    v = Volunteer.create(params[:volunteer])
    
    neighborhood = v.neighborhood 
    
    # if they are the team lead, we need to remove the team lead from params
    # and update the neighborhood table instead
    if team_lead and v.neighborhood.team_lead.nil?
      neighborhood.team_lead = v
      neighborhood.save
    end
    
    VolunteerMailer.thank_you(v).deliver
  
  end

end
