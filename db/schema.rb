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

ActiveRecord::Schema.define(version: 2023_04_05_073507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.bigint "student_id"
    t.index ["paper_id"], name: "index_comments_on_paper_id"
    t.index ["student_id"], name: "index_comments_on_student_id"
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

  create_table "paper_read_status", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "paper_id", null: false
    t.index ["student_id", "paper_id"], name: "index_paper_read_status_on_student_id_and_paper_id"
  end

  create_table "papers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "release_date"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.index ["category_id"], name: "index_papers_on_category_id"
    t.index ["student_id"], name: "index_papers_on_student_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "paper_id", null: false
    t.integer "rating"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["paper_id"], name: "index_ratings_on_paper_id"
    t.index ["student_id"], name: "index_ratings_on_student_id"
  end

  create_table "student_comment_ratings", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "comment_id"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_student_comment_ratings_on_comment_id"
    t.index ["student_id"], name: "index_student_comment_ratings_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "genres_papers", "genres"
  add_foreign_key "genres_papers", "papers"
  add_foreign_key "ratings", "papers"
end
