class Neighborhood < ActiveRecord::Base
  has_many :volunteers
  belongs_to :team_lead, :class_name => 'Volunteer', :foreign_key => 'volunteer_id'

  attr_accessible :name, :file_id, :drop_location
end
