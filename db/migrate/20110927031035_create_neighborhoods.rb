class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.timestamps
      t.string :name, :null => false
      t.string :filename
    end
  end
end
