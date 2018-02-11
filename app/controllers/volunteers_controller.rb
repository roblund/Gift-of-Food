class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
  end

  def create

    @volunteer = Volunteer.create(volunteer_params)

    #make sure we don't have any error messages before we try to assign the neighborhood
    if @volunteer.errors.messages.count == 0
      @volunteer.save
      VolunteerMailer.thank_you(@volunteer).deliver_now
    end

  end

  def maps
    #look for the neighborhood url param and then set the neighborhood
    if !params[:neighborhood].nil?
      begin
        #attempt to find the neighborhood
        @hood = Neighborhood.find(params[:neighborhood])
      rescue ActiveRecord::RecordNotFound
        #no neighborhood found
        @error_message = "Sent in neighborhood not found."
      end
    else
      #no neighborhood found
      @error_message = "No neighborhood was sent in."
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :phone, :company, :neighborhood_id, :is_mobile)
  end

end
