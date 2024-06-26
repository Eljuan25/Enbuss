# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_15_233709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.time "time"
    t.bigint "trajectory_id", null: false
    t.bigint "stop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_schedules_on_stop_id"
    t.index ["trajectory_id"], name: "index_schedules_on_trajectory_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services_units", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "unit_id", null: false
    t.index ["service_id", "unit_id"], name: "index_services_units_on_service_id_and_unit_id"
    t.index ["unit_id", "service_id"], name: "index_services_units_on_unit_id_and_service_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "name", null: false
    t.geometry "trajectory_geom", limit: {:srid=>0, :type=>"geometry"}
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops_cities", force: :cascade do |t|
    t.bigint "stop_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_stops_cities_on_city_id"
    t.index ["stop_id"], name: "index_stops_cities_on_stop_id"
  end

  create_table "trajectories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "passing_frequency", null: false
    t.integer "estimated_time", null: false
    t.integer "service_cost", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.point "trajectory_point", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_trajectories_on_city_id"
  end

  create_table "trajectories_stops", force: :cascade do |t|
    t.bigint "trajectory_id"
    t.bigint "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_trajectories_stops_on_stop_id"
    t.index ["trajectory_id"], name: "index_trajectories_stops_on_trajectory_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.integer "capacity", null: false
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_units_on_type_id"
  end

  create_table "units_trajectories", force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "trajectory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trajectory_id"], name: "index_units_trajectories_on_trajectory_id"
    t.index ["unit_id"], name: "index_units_trajectories_on_unit_id"
  end

  add_foreign_key "schedules", "stops"
  add_foreign_key "schedules", "trajectories"
  add_foreign_key "stops_cities", "cities"
  add_foreign_key "stops_cities", "stops"
  add_foreign_key "trajectories", "cities"
  add_foreign_key "trajectories_stops", "stops"
  add_foreign_key "trajectories_stops", "trajectories"
  add_foreign_key "units", "types"
  add_foreign_key "units_trajectories", "trajectories"
  add_foreign_key "units_trajectories", "units"
end
