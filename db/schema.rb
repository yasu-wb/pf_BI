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

ActiveRecord::Schema.define(version: 2021_03_20_051656) do

  create_table "analyses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "list_id", null: false
    t.bigint "item_id", null: false
    t.time "datetime", null: false
    t.string "tank_no", null: false
    t.float "density", null: false
    t.float "alcohol", null: false
    t.float "extract", null: false
    t.float "acid_degree"
    t.float "amino_acid"
    t.float "color"
    t.float "nacl"
    t.float "turbidity"
    t.integer "free_sulfurous_acid"
    t.integer "total_sulfurous_acid"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_analyses_on_item_id"
    t.index ["list_id"], name: "index_analyses_on_list_id"
  end

  create_table "item_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_lists_on_item_id"
    t.index ["list_id"], name: "index_item_lists_on_list_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "incode", null: false
    t.string "name", null: false
    t.integer "main_category", null: false
    t.integer "sub_category", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false
    t.integer "incode", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "number_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.integer "in_charge1"
    t.integer "in_charge2"
    t.integer "in_charge3"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number_id"], name: "index_users_on_number_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "analyses", "items"
  add_foreign_key "analyses", "lists"
  add_foreign_key "item_lists", "items"
  add_foreign_key "item_lists", "lists"
end
