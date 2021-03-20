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

ActiveRecord::Schema.define(version: 2021_03_20_072020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "house_number"
    t.string "zip_code"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lng"
    t.float "lat"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_branches_on_address_id"
    t.index ["restaurant_id"], name: "index_branches_on_restaurant_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.bigint "address_id"
    t.index ["address_id"], name: "index_clients_on_address_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "ingredients"
    t.float "price"
    t.string "cuisine"
    t.string "type"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["restaurant_id"], name: "index_foods_on_restaurant_id"
  end

  create_table "hacknu_conversations", force: :cascade do |t|
    t.bigint "user1_id"
    t.bigint "user2_id"
    t.bigint "topic_room_id"
    t.boolean "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_room_id"], name: "index_hacknu_conversations_on_topic_room_id"
    t.index ["user1_id"], name: "index_hacknu_conversations_on_user1_id"
    t.index ["user2_id"], name: "index_hacknu_conversations_on_user2_id"
  end

  create_table "hacknu_images", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hacknu_images_on_user_id"
  end

  create_table "hacknu_likes", force: :cascade do |t|
    t.bigint "fan_id"
    t.bigint "crush_id"
    t.string "fan_like_type"
    t.string "crush_like_type"
    t.boolean "matched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crush_id"], name: "index_hacknu_likes_on_crush_id"
    t.index ["fan_id"], name: "index_hacknu_likes_on_fan_id"
  end

  create_table "hacknu_preferences", force: :cascade do |t|
    t.integer "min_age"
    t.integer "max_age"
    t.integer "distance"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hacknu_preferences_on_user_id"
  end

  create_table "hacknu_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hacknu_topic_rooms", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "user_id"
    t.boolean "free"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_hacknu_topic_rooms_on_topic_id"
    t.index ["user_id"], name: "index_hacknu_topic_rooms_on_user_id"
  end

  create_table "hacknu_topic_tags", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hacknu_topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hacknu_users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.integer "age"
    t.float "lat"
    t.float "lng"
    t.string "gender"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["branch_id"], name: "index_managers_on_branch_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "food_id"
    t.bigint "client_id"
    t.datetime "expires_at"
    t.datetime "deadline"
    t.float "discount_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "owner_id"
    t.integer "owner"
    t.index ["branch_id"], name: "index_orders_on_branch_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["food_id"], name: "index_orders_on_food_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "cuisine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "avatar"
    t.string "description"
    t.string "contacts"
    t.string "website"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.integer "manager_id"
    t.integer "restaurant_id"
    t.integer "admin_id"
    t.integer "client_id"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "branches", "addresses"
  add_foreign_key "branches", "restaurants"
  add_foreign_key "cities", "countries"
  add_foreign_key "clients", "addresses"
  add_foreign_key "foods", "restaurants"
  add_foreign_key "hacknu_conversations", "hacknu_topic_rooms", column: "topic_room_id"
  add_foreign_key "hacknu_conversations", "hacknu_users", column: "user1_id"
  add_foreign_key "hacknu_conversations", "hacknu_users", column: "user2_id"
  add_foreign_key "hacknu_images", "hacknu_users", column: "user_id"
  add_foreign_key "hacknu_likes", "hacknu_users", column: "crush_id"
  add_foreign_key "hacknu_likes", "hacknu_users", column: "fan_id"
  add_foreign_key "hacknu_preferences", "hacknu_users", column: "user_id"
  add_foreign_key "hacknu_topic_rooms", "hacknu_topics", column: "topic_id"
  add_foreign_key "hacknu_topic_rooms", "hacknu_users", column: "user_id"
  add_foreign_key "managers", "branches"
  add_foreign_key "orders", "branches"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "clients", column: "owner_id"
  add_foreign_key "orders", "foods"
end
