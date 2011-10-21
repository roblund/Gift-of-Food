class Volunteer < ActiveRecord::Base

  belongs_to :neighborhood
  
  def is_team_lead?
    if !self.neighborhood.volunteer_id.nil? and self.neighborhood.volunteer_id == self.id
      return true
    else
      return false
    end
  end

end
