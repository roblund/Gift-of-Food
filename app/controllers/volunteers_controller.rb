class VolunteersController < ApplicationController
  
  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.create(params[:volunteer])
  end

end
