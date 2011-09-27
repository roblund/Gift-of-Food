class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|

      t.timestamps
    end
  end
end
