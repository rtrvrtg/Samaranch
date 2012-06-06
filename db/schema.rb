# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120606235959) do

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "sorting_name"
    t.text     "bio"
    t.text     "website"
    t.text     "twitter"
    t.text     "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "guests_sessions", :id => false, :force => true do |t|
    t.integer "guest_id"
    t.integer "session_id"
  end

  add_index "guests_sessions", ["guest_id", "session_id"], :name => "index_guests_sessions_on_guest_id_and_session_id"
  add_index "guests_sessions", ["session_id", "guest_id"], :name => "index_guests_sessions_on_session_id_and_guest_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "venue_map_id"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marker_id"
  end

  create_table "markers", :force => true do |t|
    t.string   "title"
    t.integer  "anchor_x"
    t.integer  "anchor_y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "marker_image_file_name"
    t.string   "marker_image_content_type"
    t.integer  "marker_image_file_size"
    t.datetime "marker_image_updated_at"
  end

  create_table "session_types", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.integer  "location_id"
    t.integer  "session_type_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions_guests", :id => false, :force => true do |t|
    t.integer "session_id"
    t.integer "guest_id"
  end

  add_index "sessions_guests", ["guest_id", "session_id"], :name => "index_sessions_guests_on_guest_id_and_session_id"
  add_index "sessions_guests", ["session_id", "guest_id"], :name => "index_sessions_guests_on_session_id_and_guest_id"

  create_table "sponsor_types", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.integer  "sponsor_type_id"
    t.text     "description"
    t.text     "website"
    t.text     "twitter"
    t.text     "facebook"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",             :null => false
    t.string   "email",             :null => false
    t.string   "first_name",        :null => false
    t.string   "last_name",         :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_maps", :force => true do |t|
    t.integer  "venue_id"
    t.string   "map_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map_image_file_name"
    t.string   "map_image_content_type"
    t.integer  "map_image_file_size"
    t.datetime "map_image_updated_at"
  end

  create_table "venue_travel_details", :force => true do |t|
    t.integer  "venue_id"
    t.string   "method"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
