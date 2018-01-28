class AddFileIdToNeighborhood < ActiveRecord::Migration[5.1]
  def change
    add_column :neighborhoods, :file_id, :integer
  end
end
