class RemoveFilenameFromNeighborhood < ActiveRecord::Migration[5.1]
  def change
    remove_column :neighborhoods, :filename
  end
end
