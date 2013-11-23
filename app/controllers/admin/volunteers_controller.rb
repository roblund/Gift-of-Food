class Admin::VolunteersController < ApplicationController
  require 'fastercsv'

  if Rails.env.production?
    http_basic_authenticate_with :name => ENV['GOF_USERNAME'], :password => ENV['GOF_SECRET']
  else
    http_basic_authenticate_with :name => "frodo", :password => "thering"
  end

  @@locations = [
    ["All", 0],
    ["Bogert Park", 1],
    ["Home Depot", 2],
    ["MSU Fieldhouse", 3],
    ["Rosauer's", 4],
    ["Belgrade Town Pump", 5]
  ]

  def index
    @volunteers = Volunteer.order('created_at ASC').all
    @all_emails = Volunteer.uniq.pluck(:email) * '; '
    gon.emails = [
      @all_emails,
      Volunteer.joins(:neighborhood).where('neighborhoods.drop_location' => 1).uniq.pluck(:email) * '; ',
      Volunteer.joins(:neighborhood).where('neighborhoods.drop_location' => 2).uniq.pluck(:email) * '; ',
      Volunteer.joins(:neighborhood).where('neighborhoods.drop_location' => 3).uniq.pluck(:email) * '; ',
      Volunteer.joins(:neighborhood).where('neighborhoods.drop_location' => 4).uniq.pluck(:email) * '; ',
      Volunteer.joins(:neighborhood).where('neighborhoods.drop_location' => 5).uniq.pluck(:email) * '; ',
    ]

    respond_to do |format|
      format.html
      format.csv do
        @timestamp = Time.now.strftime('%Y-%m-%d_%H:%M:%S')
        @output_encoding = 'UTF-8'
        @filename = "volunteers_#{@timestamp}.csv"
      end
    end
  end

  def maps
    @volunteers = Volunteer.joins(:neighborhood).order(:drop_location)
    render :layout => 'layouts/map_print'
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @v = Volunteer.find(params[:id])
    @v.neighborhood.team_lead = nil
    @v.neighborhood.save
    @v.update_attributes!(params[:volunteer])
    @v.neighborhood.team_lead = @v
    @v.neighborhood.save

    redirect_to admin_volunteers_path
  end

  def destroy
    v = Volunteer.find(params[:id])
    if v.neighborhood.team_lead = v
      v.neighborhood.team_lead = nil
      v.neighborhood.save
    end
    v.delete
    redirect_to admin_volunteers_path
  end

  helper_method :locations
  def locations
    @@locations
  end

end
