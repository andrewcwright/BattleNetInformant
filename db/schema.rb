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

ActiveRecord::Schema.define(:version => 20130611191823) do

  create_table "characters", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "realm"
    t.string   "battlegroup"
    t.string   "character_class"
    t.string   "race"
    t.string   "gender"
    t.integer  "level"
    t.integer  "achievementPoints"
    t.integer  "health"
    t.string   "powerType"
    t.integer  "power"
    t.integer  "strength"
    t.integer  "agility"
    t.integer  "stamina"
    t.integer  "intellect"
    t.integer  "spirit"
    t.decimal  "mastery",           :precision => 4, :scale => 2
    t.decimal  "pvpResilience",     :precision => 4, :scale => 2
    t.decimal  "pvpPower",          :precision => 4, :scale => 2
    t.decimal  "pvpPowerDamage",    :precision => 4, :scale => 2
    t.decimal  "pvpPowerHealing",   :precision => 4, :scale => 2
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
