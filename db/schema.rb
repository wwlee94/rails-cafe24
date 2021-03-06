# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_19_074339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bulletins", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "post_type"
    t.integer "post_type_cd", default: 0
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", comment: "글 제목"
    t.text "content", comment: "글 내용"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bulletin_id"
    t.string "picture"
    t.index ["bulletin_id"], name: "index_posts_on_bulletin_id"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "bulletins"
end
