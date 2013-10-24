class AddDropLocationToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :drop_location, :int
  end
end
