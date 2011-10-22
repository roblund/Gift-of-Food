class RemoveFilenameFromNeighborhood < ActiveRecord::Migration
  def change
    remove_column :neighborhoods, :filename
  end
end