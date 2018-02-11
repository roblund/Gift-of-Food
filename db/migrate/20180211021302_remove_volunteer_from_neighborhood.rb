class RemoveVolunteerFromNeighborhood < ActiveRecord::Migration[5.1]
  def change
    remove_column :neighborhoods, :volunteer_id
  end
end
