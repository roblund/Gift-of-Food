class CreateNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    create_table :neighborhoods do |t|
      t.timestamps
      t.string :name, :null => false
      t.string :filename
    end
  end
end
