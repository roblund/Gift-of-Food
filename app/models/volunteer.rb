class Volunteer < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :zip, :presence => true
  belongs_to :neighborhood
  
  def is_team_lead?
    self.neighborhood.team_lead.id == self.id
  end

end
