class Volunteer < ActiveRecord::Base

  belongs_to :neighborhood
  
  def is_team_lead?
    self.neighborhood.team_lead.id == self.id
  end

end
