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

ActiveRecord::Schema.define(:version => 20110727143128) do

  create_table "artist_groups", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidatures", :force => true do |t|
    t.integer  "tender_id"
    t.integer  "artist_group_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidatures", ["artist_group_id"], :name => "index_candidatures_on_artist_group_id"
  add_index "candidatures", ["tender_id"], :name => "index_candidatures_on_tender_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "begin"
    t.datetime "end"
    t.integer  "host_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["host_group_id"], :name => "index_events_on_host_group_id"

  create_table "fan_groups", :force => true do |t|
    t.integer  "artist_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fan_groups", ["artist_group_id"], :name => "index_fan_groups_on_artist_group_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "homepage"
    t.integer  "groupable_id"
    t.string   "groupable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "host_groups", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments_memberships", :id => false, :force => true do |t|
    t.integer  "instrument_id"
    t.integer  "membership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instruments_memberships", ["instrument_id"], :name => "index_instruments_memberships_on_instrument_id"
  add_index "instruments_memberships", ["membership_id"], :name => "index_instruments_memberships_on_membership_id"

  create_table "memberships", :force => true do |t|
    t.integer  "userable_id"
    t.string   "userable_type"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "function"
  end

  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.boolean  "read",              :default => false
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient_id"], :name => "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "program_items", :force => true do |t|
    t.integer  "event_id"
    t.integer  "artist_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_items", ["artist_group_id"], :name => "index_program_items_on_artist_group_id"
  add_index "program_items", ["event_id"], :name => "index_program_items_on_event_id"

  create_table "tenders", :force => true do |t|
    t.date     "date"
    t.text     "description"
    t.boolean  "ended",       :default => false
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tenders", ["event_id"], :name => "index_tenders_on_event_id"

  create_table "unregistered_users", :force => true do |t|
    t.string   "prename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nick"
    t.string   "prename"
    t.string   "name"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "homepage"
    t.text     "about"
    t.boolean  "show_name",                             :default => false
    t.boolean  "show_email",                            :default => false
    t.boolean  "show_street",                           :default => false
    t.boolean  "show_city",                             :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
