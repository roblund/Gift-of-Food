class Volunteer < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :neighborhood, :presence => true
  belongs_to :neighborhood
end
