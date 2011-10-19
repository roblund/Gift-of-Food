# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111019014915) do

  create_table "neighborhoods", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",         :null => false
    t.string   "filename"
    t.integer  "volunteer_id"
  end

  create_table "volunteers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "zip"
    t.string   "email"
    t.string   "phone"
    t.boolean  "is_mobile"
    t.integer  "neighborhood_id"
  end

end
