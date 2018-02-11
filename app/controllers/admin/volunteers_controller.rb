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
    ["Smith's", 2],
    ["Town and Country - 11th", 3],
    ["Rosauer's", 4],
    ["Town and Country - Belgrade", 5]
  ]

  def index
    @volunteers = Volunteer.order('created_at ASC').all
    @all_emails = Volunteer.distinct.pluck(:email) * '; '
    gon.emails = [
      @all_emails,
      Volunteer.includes(:neighborhood).where(:neighborhoods => { :drop_location => 1 }).distinct.pluck(:email) * '; ',
      Volunteer.includes(:neighborhood).where(:neighborhoods => { :drop_location => 2 }).distinct.pluck(:email) * '; ',
      Volunteer.includes(:neighborhood).where(:neighborhoods => { :drop_location => 3 }).distinct.pluck(:email) * '; ',
      Volunteer.includes(:neighborhood).where(:neighborhoods => { :drop_location => 4 }).distinct.pluck(:email) * '; ',
      Volunteer.includes(:neighborhood).where(:neighborhoods => { :drop_location => 5 }).distinct.pluck(:email) * '; ',
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
    @volunteers = Volunteer.joins(:neighborhood).order('drop_location')
    render :layout => 'layouts/map_print'
  end

  def empty_maps
    @neighborhoods = Neighborhood.includes(:volunteer).where(:volunteers => { :neighborhood_id => nil }).order('drop_location')
    render :layout => 'layouts/map_print'
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @v = Volunteer.find(params[:id])
    @v.update_attributes!(volunteer_params)
    @v.save

    redirect_to admin_volunteers_path
  end

  def destroy
    v = Volunteer.find(params[:id])
    v.delete
    redirect_to admin_volunteers_path
  end

  helper_method :locations
  def locations
    @@locations
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :phone, :company, :neighborhood_id, :is_mobile)
  end

end
