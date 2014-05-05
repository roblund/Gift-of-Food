class Neighborhood < ActiveRecord::Base
  has_many :volunteers
  belongs_to :team_lead, :class_name => 'Volunteer', :foreign_key => 'volunteer_id'
end
