class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.timestamps
      t.string :first_name
      t.string :last_name
      t.integer :zip
      t.string :email
      t.string :phone
      t.boolean :is_mobile
      t.boolean :is_team_lead
      t.integer :neighborhood_id
    end
  end
end
