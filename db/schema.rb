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

ActiveRecord::Schema.define(version: 20180129205726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.bigint "railway_station_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.time "arrival_time"
    t.time "departure_time"
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "train_id"
    t.bigint "user_id"
    t.bigint "base_station_id"
    t.bigint "final_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "passenger"
    t.index ["base_station_id"], name: "index_tickets_on_base_station_id"
    t.index ["final_station_id"], name: "index_tickets_on_final_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.bigint "current_station_id"
    t.boolean "head_direction", default: true, null: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "surname"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wagons", force: :cascade do |t|
    t.bigint "train_id"
    t.integer "bottom_places"
    t.integer "upper_places"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "side_bottom_places"
    t.integer "side_upper_places"
    t.integer "seat_places"
    t.string "type"
    t.integer "ordinal"
    t.index ["id", "type"], name: "index_wagons_on_id_and_type"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

  add_foreign_key "railway_stations_routes", "railway_stations"
  add_foreign_key "railway_stations_routes", "routes"
  add_foreign_key "tickets", "railway_stations", column: "base_station_id"
  add_foreign_key "tickets", "railway_stations", column: "final_station_id"
  add_foreign_key "tickets", "trains"
  add_foreign_key "tickets", "users"
  add_foreign_key "trains", "railway_stations", column: "current_station_id"
  add_foreign_key "trains", "routes"
  add_foreign_key "wagons", "trains"
end
