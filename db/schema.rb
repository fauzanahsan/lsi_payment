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

ActiveRecord::Schema.define(:version => 20121118154433) do

  create_table "billing_informations", :force => true do |t|
    t.integer  "order_id"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address1"
    t.text     "address2"
    t.string   "city"
    t.string   "country_code"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "course_packages", :force => true do |t|
    t.integer  "course_id"
    t.integer  "number_of_participants"
    t.integer  "course_fee",             :limit => 8
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "order_id"
    t.string   "session_id"
    t.integer  "course_package_id"
    t.integer  "course_fee",            :limit => 8, :default => 0
    t.integer  "accomodation_fee",      :limit => 8, :default => 0
    t.integer  "other_fee",             :limit => 8, :default => 0
    t.integer  "total_amount",          :limit => 8, :default => 0
    t.string   "accomodation_fee_info"
    t.string   "other_fee_info"
    t.boolean  "paid_status",                        :default => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

end
