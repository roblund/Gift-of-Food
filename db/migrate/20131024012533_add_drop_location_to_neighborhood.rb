class AddDropLocationToNeighborhood < ActiveRecord::Migration[5.1]
  def change
    add_column :neighborhoods, :drop_location, :int
  end
end
