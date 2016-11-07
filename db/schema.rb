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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161107023829) do

  create_table "caregivers", force: :cascade do |t|
    t.string   "first_name",     null: false
    t.string   "last_name",      null: false
    t.integer  "gender",         null: false
    t.date     "birthdate",      null: false
    t.string   "phone_number",   null: false
    t.string   "street_address", null: false
    t.string   "extra_address"
    t.string   "city",           null: false
    t.string   "state",          null: false
    t.string   "zip_code",       null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["group_id"], name: "index_caregivers_on_group_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",     null: false
    t.string   "last_name",      null: false
    t.integer  "gender",         null: false
    t.date     "birthdate",      null: false
    t.string   "phone_number",   null: false
    t.string   "street_address", null: false
    t.string   "extra_address"
    t.string   "city",           null: false
    t.string   "state",          null: false
    t.string   "zip_code",       null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["group_id"], name: "index_clients_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string  "name",           null: false
    t.string  "email",          null: false
    t.string  "phone_number",   null: false
    t.string  "street_address", null: false
    t.string  "extra_address"
    t.string  "city",           null: false
    t.string  "state",          null: false
    t.string  "zip_code",       null: false
    t.float   "latitude"
    t.float   "longitude"
    t.integer "group_id"
    t.index ["group_id"], name: "index_groups_on_group_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "person_type"
    t.integer  "person_id"
    t.index ["confirmation_token"], name: "index_logins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_logins_on_email", unique: true
    t.index ["person_type", "person_id"], name: "index_logins_on_person_type_and_person_id"
    t.index ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true
  end

  create_table "managers", force: :cascade do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "phone_number", null: false
    t.integer  "group_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["group_id"], name: "index_managers_on_group_id"
  end

end