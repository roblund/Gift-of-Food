class ChangeFileIdToString < ActiveRecord::Migration[5.1]
  def up
    change_column :neighborhoods, :file_id, :string
  end

  def down
    change_column :neighborhoods, :file_id, :integer
  end
end
