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

ActiveRecord::Schema[7.0].define(version: 2024_02_21_092808) do
  create_table "dogcaves", charset: "utf8mb4", force: :cascade do |t|
    t.string "cafe_name"
    t.text "cafe_discription"
    t.string "cafe_postal_code"
    t.string "cafe_region"
    t.string "cafe_locality"
    t.string "cafe_street_address"
    t.float "cafe_latitude"
    t.float "cafe_longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogruns", charset: "utf8mb4", force: :cascade do |t|
    t.string "run_name"
    t.text "run_discription"
    t.string "run_postal_code"
    t.string "run_region"
    t.string "run_locality"
    t.string "run_street_address"
    t.float "run_latitude"
    t.float "run_longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.integer "prefecture_id", null: false
    t.string "dogname", null: false
    t.string "dogtype", null: false
    t.date "birth_date"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
