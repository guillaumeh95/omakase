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

ActiveRecord::Schema.define(version: 20171208094417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "photo"
    t.boolean "family", default: false
    t.boolean "couple", default: false
    t.boolean "friends", default: false
    t.boolean "solo", default: false
    t.boolean "sight_seeing_adventurer", default: false
    t.boolean "art_lover", default: false
    t.boolean "serial_shopper", default: false
    t.boolean "food_addict", default: false
    t.boolean "sport_lover", default: false
    t.boolean "history_passionate", default: false
    t.boolean "tech_fan", default: false
    t.boolean "nature_lover", default: false
    t.boolean "relaxed", default: false
    t.boolean "city_wanderer", default: false
    t.boolean "to_book", default: false
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "title"
    t.integer "budget"
    t.integer "knows_the_city"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "host_id"
    t.integer "tourist_id"
    t.string "title"
    t.text "comment"
    t.boolean "sight_seeing_adventurer", default: false
    t.boolean "art_lover", default: false
    t.boolean "serial_shopper", default: false
    t.boolean "nature_lover", default: false
    t.boolean "food_addict", default: false
    t.boolean "sport_lover", default: false
    t.boolean "history_passionate", default: false
    t.boolean "tech_fan", default: false
    t.boolean "relaxed", default: false
    t.boolean "city_wanderer", default: false
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget"
    t.integer "knows_the_city"
    t.string "status"
    t.boolean "sent", default: false
    t.string "tourist_first_name"
    t.string "tourist_last_name"
    t.string "tourist_email"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "activity_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_visits_on_activity_id"
    t.index ["trip_id"], name: "index_visits_on_trip_id"
  end

  add_foreign_key "trips", "users", column: "host_id"
  add_foreign_key "trips", "users", column: "tourist_id"
  add_foreign_key "visits", "activities"
  add_foreign_key "visits", "trips"
end
