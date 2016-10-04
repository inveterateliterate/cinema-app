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

ActiveRecord::Schema.define(version: 20161003230802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auditoria", force: :cascade do |t|
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "runtime"
    t.string   "description"
    t.string   "rating"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "cust_last"
    t.string   "cust_first"
    t.string   "cust_email"
    t.integer  "showing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "cc_exp"
    t.bigint   "cc_num"
    t.float    "sale"
    t.integer  "movie_id"
    t.index ["movie_id"], name: "index_orders_on_movie_id", using: :btree
    t.index ["showing_id"], name: "index_orders_on_showing_id", using: :btree
  end

  create_table "showings", force: :cascade do |t|
    t.date     "date"
    t.datetime "showtime"
    t.integer  "movie_id"
    t.integer  "auditorium_id"
    t.integer  "avail_seats"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["auditorium_id"], name: "index_showings_on_auditorium_id", using: :btree
    t.index ["movie_id"], name: "index_showings_on_movie_id", using: :btree
  end

  add_foreign_key "orders", "movies"
  add_foreign_key "orders", "showings"
  add_foreign_key "showings", "auditoria"
  add_foreign_key "showings", "movies"
end
