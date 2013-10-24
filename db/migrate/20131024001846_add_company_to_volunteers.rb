class AddCompanyToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :company, :string
  end
end
