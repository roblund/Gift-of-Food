class Admin::VolunteersController < ApplicationController

  http_basic_authenticate_with :name => "frodo", :password => "thering"

  require 'fastercsv'

  def index
    @volunteers = Volunteer.order('last_name DESC').all
    
    respond_to do |format|
      format.html
      format.csv do
        @timestamp = Time.now.strftime('%Y-%m-%d_%H:%M:%S')
        @output_encoding = 'UTF-8'
        @filename = "volunteers_#{@timestamp}.csv"
      end
    end
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @v = Volunteer.find(params[:id])
   
    team_lead = params[:volunteer].delete(:is_team_lead)
    @v.update_attributes!(params[:volunteer])
   
    neighborhood = @v.neighborhood 
    
    # if they are the team lead, we need to remove the team lead from params
    # and update the neighborhood table instead
    if team_lead
      neighborhood.team_lead = @v
      neighborhood.save
    elsif neighborhood.team_lead.id == @v.id
      neighborhood.team_lead = nil
      neighborhood.save
    end
  
    redirect_to admin_volunteers_path
  end

  def destroy
    Volunteer.find(params[:id]).delete
    redirect_to admin_volunteers_path
  end

end
