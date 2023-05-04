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

ActiveRecord::Schema.define(version: 2023_03_12_134040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "category_code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "paper_id"
    t.text "comment_text"
    t.index ["paper_id"], name: "index_comments_on_paper_id"
  end

  create_table "genres", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_papers", id: :serial, force: :cascade do |t|
    t.integer "paper_id"
    t.integer "genre_id"
    t.index ["genre_id"], name: "index_genres_papers_on_genre_id"
    t.index ["paper_id"], name: "index_genres_papers_on_paper_id"
  end

  create_table "papers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "release_date"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_papers_on_category_id"
  end

  add_foreign_key "genres_papers", "genres"
  add_foreign_key "genres_papers", "papers"
end
