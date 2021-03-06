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

ActiveRecord::Schema.define(version: 20180503235236) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "library_id"
    t.integer "book_id"
    t.string "name", default: "", null: false
    t.string "author", default: "", null: false
    t.string "cipher", default: "", null: false
    t.string "publishing_house", default: "", null: false
    t.string "publishing_date", default: "", null: false
    t.integer "price"
    t.string "entrance_date", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "issuances_count", default: 0, null: false
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "issuances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subscriber_id"
    t.bigint "book_id"
    t.date "issuance_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_issuances_on_book_id"
    t.index ["subscriber_id"], name: "index_issuances_on_subscriber_id"
  end

  create_table "libraries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "number", default: "", null: false
    t.text "name", null: false
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "library_id"
    t.integer "subscriber_id"
    t.integer "ticket_number", null: false
    t.string "surname", default: "", null: false
    t.string "name", default: "", null: false
    t.string "patronymic", default: "", null: false
    t.text "address", null: false
    t.string "phone_number", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_subscribers_on_library_id"
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "library_id"
    t.string "surname", default: "", null: false
    t.string "name", default: "", null: false
    t.string "patronymic", default: "", null: false
    t.date "birthday"
    t.date "employment_day"
    t.string "position", default: "", null: false
    t.string "education", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_workers_on_library_id"
  end

end
