class VolunteerController < ApplicationController

  def create
    Volunteer.create(params[:volunteer])
  end

end
