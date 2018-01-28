class AddRegionNumberToNeighborhood < ActiveRecord::Migration[5.1]
  def change
    add_column :neighborhoods, :region, :int
  end
end
