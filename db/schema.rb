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

ActiveRecord::Schema.define(:version => 20120130101537) do

  create_table "barcode_locations", :force => true do |t|
    t.integer  "barcode_id",                      :null => false
    t.integer  "user_id",                         :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.point    "geom",             :limit => nil,                 :srid => 4326
    t.float    "accuracy"
    t.datetime "device_timestamp"
  end

  add_index "barcode_locations", ["geom"], :name => "index_barcode_locations_on_geom", :spatial => true

  create_table "barcodes", :force => true do |t|
    t.string   "code",       :null => false
    t.text     "name"
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "barcode_id"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tile_y_coordinates", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.point    "geom",       :limit => nil, :null => false, :srid => 4326, :with_z => true
  end

  add_index "tile_y_coordinates", ["geom"], :name => "index_tile_y_coordinates_on_geom", :spatial => true

  create_table "user_locations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.point    "geom",        :limit => nil, :srid => 4326
    t.integer  "user_id"
    t.text     "description"
  end

  add_index "user_locations", ["geom"], :name => "index_user_locations_on_geom", :spatial => true

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
