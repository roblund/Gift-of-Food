class VolunteersController < ApplicationController
  
  def new
    @volunteer = Volunteer.new
  end

  def create
    v = Volunteer.create(params[:volunteer])
  end

end
