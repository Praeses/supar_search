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

ActiveRecord::Schema.define(:version => 20120808134324) do

  create_table "addresses", :force => true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "addresses", ["company_id"], :name => "index_addresses_on_company_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "slogan"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
