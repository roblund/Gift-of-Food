class VolunteersController < ApplicationController
  
  def create
    Volunteer.create(params[:volunteer])
  end

end
