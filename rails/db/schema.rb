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

ActiveRecord::Schema.define(version: 2021_09_19_124624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "db_customers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "phone_number", limit: 15
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone_number"], name: "index_db_customers_on_phone_number", unique: true
  end

  create_table "db_deliveries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "delivered_at", precision: 6
    t.datetime "started_at", precision: 6
    t.uuid "db_delivery_man_id", null: false
    t.uuid "db_customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["db_customer_id"], name: "index_db_deliveries_on_db_customer_id"
    t.index ["db_delivery_man_id"], name: "index_db_deliveries_on_db_delivery_man_id"
  end

  create_table "db_delivery_men", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", limit: 20
    t.string "last_name", limit: 20
    t.string "phone_number", limit: 15
    t.string "identifier", limit: 5
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["identifier"], name: "index_db_delivery_men_on_identifier", unique: true
    t.index ["phone_number"], name: "index_db_delivery_men_on_phone_number", unique: true
  end

  add_foreign_key "db_deliveries", "db_customers"
  add_foreign_key "db_deliveries", "db_delivery_men"
end
