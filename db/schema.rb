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

ActiveRecord::Schema.define(version: 2023_01_27_004735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "city"
    t.string "country"
    t.string "zip_code"
    t.string "latitude"
    t.string "longitude"
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
    t.index ["profile_id"], name: "index_addresses_on_profile_id"
  end

  create_table "collect_statuses", force: :cascade do |t|
    t.string "name"
    t.bigint "collect_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collect_id"], name: "index_collect_statuses_on_collect_id"
  end

  create_table "collects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_collects_on_user_id"
  end

  create_table "configs", force: :cascade do |t|
    t.string "param"
    t.integer "value"
    t.bigint "system_module_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["system_module_id"], name: "index_configs_on_system_module_id"
  end

  create_table "item_collects", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "collect_id", null: false
    t.float "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collect_id"], name: "index_item_collects_on_collect_id"
    t.index ["item_id"], name: "index_item_collects_on_item_id"
  end

  create_table "item_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "point"
    t.float "point_weight"
    t.string "name"
    t.bigint "item_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_type_id"], name: "index_items_on_item_type_id"
  end

  create_table "point_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "collector_id", null: false
    t.bigint "collect_id", null: false
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collect_id"], name: "index_point_histories_on_collect_id"
    t.index ["collector_id"], name: "index_point_histories_on_collector_id"
    t.index ["user_id"], name: "index_point_histories_on_user_id"
  end

  create_table "product_user_histories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.integer "quantity", default: 1
    t.integer "total_points"
    t.integer "user_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id", "user_id"], name: "index_product_user_histories_on_product_id_and_user_id"
    t.index ["product_id"], name: "index_product_user_histories_on_product_id"
    t.index ["user_id"], name: "index_product_user_histories_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.float "point"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "document"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "recyclables", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit_of_measurement", default: 0, null: false
    t.float "measure", null: false
    t.integer "point", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id", null: false
    t.datetime "expire_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_refresh_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_refresh_tokens_on_user_id"
  end

  create_table "route_collects", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "collect_id", null: false
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collect_id"], name: "index_route_collects_on_collect_id"
    t.index ["route_id"], name: "index_route_collects_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.date "collect_date"
    t.datetime "request_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "system_module_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "system_module_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["system_module_id"], name: "index_system_module_users_on_system_module_id"
    t.index ["user_id"], name: "index_system_module_users_on_user_id"
  end

  create_table "system_modules", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_system_modules_on_user_id"
  end

  create_table "user_points", force: :cascade do |t|
    t.integer "value"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_points_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token", limit: 250
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "profiles"
  add_foreign_key "collect_statuses", "collects"
  add_foreign_key "collects", "users"
  add_foreign_key "configs", "system_modules"
  add_foreign_key "item_collects", "collects"
  add_foreign_key "item_collects", "items"
  add_foreign_key "items", "item_types"
  add_foreign_key "point_histories", "collects"
  add_foreign_key "point_histories", "users"
  add_foreign_key "point_histories", "users", column: "collector_id"
  add_foreign_key "product_user_histories", "products"
  add_foreign_key "product_user_histories", "users"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "refresh_tokens", "users"
  add_foreign_key "route_collects", "collects"
  add_foreign_key "route_collects", "routes"
  add_foreign_key "routes", "users"
  add_foreign_key "system_module_users", "system_modules"
  add_foreign_key "system_module_users", "users"
  add_foreign_key "system_modules", "users"
  add_foreign_key "user_points", "users"
end
