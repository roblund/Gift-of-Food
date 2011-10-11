class Admin::VolunteersController < ApplicationController

  require 'fastercsv'

  def index
    @volunteers = Volunteer.order('last_name DESC').all
    
    respond_to do |format|
      format.html
      format.csv do
        @timestamp = Time.now.strftime('%Y-%m-%d_%H:%M:%S')
        @filename = "volunteers_#{@timestamp}.csv"
      end
    end
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    v = Volunteer.create(params[:volunteer])
    redirect_to admin_volunteer_path(v)
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @v = Volunteer.find(params[:id])
    @v.update_attributes!(params[:volunteer])
    redirect_to admin_volunteers_path
  end

  def destroy
    Volunteer.find(params[:id]).delete
    redirect_to admin_volunteers_path
  end

end
