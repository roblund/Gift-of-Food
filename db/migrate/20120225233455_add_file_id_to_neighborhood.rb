class AddFileIdToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :file_id, :integer

  end
end
