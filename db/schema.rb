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

ActiveRecord::Schema.define(version: 2020_01_02_055613) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "genre"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "artist_id"
    t.integer "show_id"
    t.string "favorite_artist"
  end

  create_table "shows", force: :cascade do |t|
    t.string "venue_name"
    t.string "venue_city"
    t.string "date"
    t.string "venue_state"
  end

end
