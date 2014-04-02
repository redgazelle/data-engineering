# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140401163644) do

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchants", ["name", "address"], name: "index_merchants_on_name_and_address"

  create_table "products", force: true do |t|
    t.string   "description"
    t.decimal  "price"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["description", "price", "merchant_id"], name: "index_products_on_description_and_price_and_merchant_id"

  create_table "purchase_batches", force: true do |t|
    t.string   "state",      default: "initialized"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_items", force: true do |t|
    t.integer  "purchase_id"
    t.integer  "product_id"
    t.integer  "purchase_count", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_items", ["purchase_id"], name: "index_purchase_items_on_purchase_id"

  create_table "purchasers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchasers", ["name"], name: "index_purchasers_on_name"

  create_table "purchases", force: true do |t|
    t.integer  "purchase_batch_id"
    t.integer  "purchaser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["purchase_batch_id"], name: "index_purchases_on_purchase_batch_id"
  add_index "purchases", ["purchaser_id"], name: "index_purchases_on_purchaser_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
