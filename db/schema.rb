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

ActiveRecord::Schema.define(version: 20171202185256) do

  create_table "bill_templates", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.integer  "reminder_template_id"
    t.string   "url"
    t.datetime "triggered_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.integer  "reminder_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "url",         default: "#"
    t.boolean  "archived",    default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.float    "amount",        default: 0.0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "category_type", default: "BUDGET"
  end

  create_table "funds", force: :cascade do |t|
    t.float    "amount",     default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reminder_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "frequency"
    t.datetime "triggered_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.string   "name"
    t.boolean  "archived",   default: false
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "category_id"
    t.string   "payment_type", default: "PAY", null: false
    t.integer  "bill_id",      default: 0
  end

end
