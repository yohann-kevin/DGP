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

ActiveRecord::Schema.define(version: 2022_01_19_113850) do

  create_table "favorite_galactic_pictures", force: :cascade do |t|
    t.string "galactic_picture_id"
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "galactic_pictures", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.datetime "date"
    t.text "description"
    t.string "title"
    t.string "media_type"
    t.string "copyright"
    t.string "hd_url"
    t.string "url"
    t.integer "to_like", default: 0
    t.integer "download", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_galactic_pictures_on_date", unique: true
  end

  create_table "users", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "pseudo"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
