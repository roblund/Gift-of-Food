class AddRegionNumberToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :region, :int
  end
end
