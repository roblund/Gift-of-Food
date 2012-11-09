class Volunteer < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :neighborhood, :presence => true
  validates :email, :uniqueness => true
  belongs_to :neighborhood
  
  def is_team_lead?
    if !self.neighborhood.volunteer_id.nil? and self.neighborhood.volunteer_id == self.id
      return true
    else
      return false
    end
  end

end
