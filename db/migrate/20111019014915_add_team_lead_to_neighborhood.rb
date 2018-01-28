class AddTeamLeadToNeighborhood < ActiveRecord::Migration[5.1]
  def change
    add_column :neighborhoods, :volunteer_id, :integer
    remove_column :volunteers, :is_team_lead
  end
end
