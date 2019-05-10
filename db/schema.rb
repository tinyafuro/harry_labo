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

ActiveRecord::Schema.define(version: 20190510012153) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "subject"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_articles_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "field"
    t.string "carmodel"
    t.string "carsize"
    t.string "other"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["user_id", "created_at"], name: "index_cars_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "goods", force: :cascade do |t|
    t.integer "article_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "user_id"], name: "index_goods_on_article_id_and_user_id", unique: true
    t.index ["article_id"], name: "index_goods_on_article_id"
    t.index ["user_id"], name: "index_goods_on_user_id"
  end

  create_table "reserves", force: :cascade do |t|
    t.date "rdate"
    t.integer "car_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id", "user_id"], name: "index_reserves_on_car_id_and_user_id", unique: true
    t.index ["car_id"], name: "index_reserves_on_car_id"
    t.index ["user_id"], name: "index_reserves_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
