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

ActiveRecord::Schema[7.0].define(version: 2023_01_04_015552) do
  create_table "address_barangays", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "city_municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_municipality_id"], name: "index_address_barangays_on_city_municipality_id"
  end

  create_table "address_city_municipalities", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_address_city_municipalities_on_province_id"
  end

  create_table "address_provinces", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_address_provinces_on_region_id"
  end

  create_table "address_regions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", charset: "utf8mb4", force: :cascade do |t|
    t.integer "genre"
    t.string "name"
    t.string "street_address"
    t.string "phone"
    t.string "remark"
    t.boolean "is_default"
    t.bigint "user_id"
    t.bigint "address_region_id"
    t.bigint "address_province_id"
    t.bigint "address_city_municipality_id"
    t.bigint "address_barangay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_barangay_id"], name: "index_addresses_on_address_barangay_id"
    t.index ["address_city_municipality_id"], name: "index_addresses_on_address_city_municipality_id"
    t.index ["address_province_id"], name: "index_addresses_on_address_province_id"
    t.index ["address_region_id"], name: "index_addresses_on_address_region_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "banners", charset: "utf8mb4", force: :cascade do |t|
    t.string "preview"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort"
  end

  create_table "bets", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.integer "coins", default: 1
    t.string "state"
    t.string "serial_number"
    t.integer "batch_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_bets_on_item_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort"
  end

  create_table "item_category_ships", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_item_category_ships_on_category_id"
    t.index ["item_id"], name: "index_item_category_ships_on_item_id"
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "quantity"
    t.integer "minimum_bets"
    t.string "state"
    t.integer "batch_count", default: 0
    t.datetime "online_at"
    t.datetime "offline_at"
    t.datetime "start_at"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "member_levels", charset: "utf8mb4", force: :cascade do |t|
    t.integer "level"
    t.integer "required_members"
    t.integer "coins", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_tickers", charset: "utf8mb4", force: :cascade do |t|
    t.text "content"
    t.integer "status"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "sort"
    t.index ["admin_id"], name: "index_news_tickers_on_admin_id"
  end

  create_table "offers", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "genre"
    t.integer "status"
    t.float "amount"
    t.integer "coin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "offer_id"
    t.string "serial_number"
    t.string "state"
    t.float "amount"
    t.integer "coin", default: 0
    t.string "remarks"
    t.integer "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_orders_on_offer_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "sessions", charset: "utf8mb4", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.integer "role", default: 0
    t.string "phone"
    t.integer "coins", default: 0
    t.decimal "total_deposit", precision: 12, scale: 2
    t.integer "children_members", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.bigint "parent_id"
    t.bigint "member_level_id"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["member_level_id"], name: "index_users_on_member_level_id"
    t.index ["parent_id"], name: "index_users_on_parent_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "winners", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "bet_id"
    t.bigint "user_id"
    t.bigint "address_id"
    t.integer "item_batch_count"
    t.string "state"
    t.float "price", default: 0.0
    t.datetime "paid_at"
    t.bigint "admin_id"
    t.string "image"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_winners_on_address_id"
    t.index ["admin_id"], name: "index_winners_on_admin_id"
    t.index ["bet_id"], name: "index_winners_on_bet_id"
    t.index ["item_id"], name: "index_winners_on_item_id"
    t.index ["user_id"], name: "index_winners_on_user_id"
  end

end
