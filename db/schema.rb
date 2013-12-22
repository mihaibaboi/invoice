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

ActiveRecord::Schema.define(version: 20131222134031) do

  create_table "entities", force: true do |t|
    t.integer  "entity_type_id"
    t.string   "name",                               null: false
    t.string   "registration_number",                null: false
    t.string   "commercial_registration"
    t.string   "bank_name",                          null: false
    t.string   "bank_account",            limit: 24, null: false
    t.string   "address_line",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entities", ["entity_type_id"], name: "index_entities_on_entity_type_id"

  create_table "entity_types", force: true do |t|
    t.string "code", limit: 3,  null: false
    t.string "name", limit: 20, null: false
  end

  create_table "invoice_entities", force: true do |t|
    t.integer  "entity_id"
    t.integer  "invoice_id"
    t.integer  "invoice_entity_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_entities", ["entity_id"], name: "index_invoice_entities_on_entity_id"
  add_index "invoice_entities", ["invoice_entity_type_id"], name: "index_invoice_entities_on_invoice_entity_type_id"
  add_index "invoice_entities", ["invoice_id"], name: "index_invoice_entities_on_invoice_id"

  create_table "invoice_entity_types", force: true do |t|
    t.string "code", limit: 3, null: false
    t.string "name",           null: false
  end

  create_table "invoice_items", force: true do |t|
    t.integer  "invoice_id"
    t.string   "description",       null: false
    t.string   "measurement_units", null: false
    t.integer  "number_of_units",   null: false
    t.float    "unit_price",        null: false
    t.float    "total_price",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_items", ["invoice_id"], name: "index_invoice_items_on_invoice_id"

  create_table "invoice_types", force: true do |t|
    t.string "code", limit: 3,  null: false
    t.string "name", limit: 25, null: false
  end

  create_table "invoices", force: true do |t|
    t.integer  "invoice_type_id"
    t.string   "serial",          limit: 10,             null: false
    t.integer  "number",                                 null: false
    t.date     "invoice_date",                           null: false
    t.float    "invoice_amount",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                    default: 0, null: false
  end

  add_index "invoices", ["invoice_type_id"], name: "index_invoices_on_invoice_type_id"
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id"

  create_table "receipts", force: true do |t|
    t.integer  "invoice_id"
    t.string   "serial",              limit: 10, null: false
    t.integer  "number",                         null: false
    t.date     "receipt_date",                   null: false
    t.string   "payer_name",                     null: false
    t.string   "registration_number"
    t.string   "address_line"
    t.float    "amount",                         null: false
    t.string   "representing"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receipts", ["invoice_id"], name: "index_receipts_on_invoice_id"

  create_table "user_types", force: true do |t|
    t.string   "code",       limit: 3,  null: false
    t.string   "name",       limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "user_type_id"
    t.string   "username",        limit: 25,  null: false
    t.string   "email",           limit: 50,  null: false
    t.string   "hashed_password", limit: 40,  null: false
    t.string   "first_name",      limit: 100
    t.string   "last_name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id"

end
