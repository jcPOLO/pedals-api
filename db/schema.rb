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

ActiveRecord::Schema.define(version: 20171005183431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "component_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.integer "value"
    t.integer "legs"
    t.boolean "log"
    t.boolean "rev"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "component_type_id"
    t.index ["component_type_id"], name: "index_components_on_component_type_id"
  end

  create_table "components_projects", id: false, force: :cascade do |t|
    t.bigint "component_id", null: false
    t.bigint "project_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id", "project_id"], name: "index_components_projects_on_component_id_and_project_id"
    t.index ["project_id", "component_id"], name: "index_components_projects_on_project_id_and_component_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "inventory", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "components", "component_types"
end
