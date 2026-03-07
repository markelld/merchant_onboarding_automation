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

ActiveRecord::Schema[8.1].define(version: 2026_03_07_215701) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "advertisers", force: :cascade do |t|
    t.string "advertiser_external_id"
    t.string "contact_email"
    t.string "contact_name"
    t.datetime "created_at", null: false
    t.string "merchant_name"
    t.datetime "updated_at", null: false
    t.string "vertical"
    t.string "website"
  end

  create_table "automation_runs", force: :cascade do |t|
    t.bigint "advertiser_id"
    t.datetime "created_at", null: false
    t.text "error_message"
    t.datetime "finished_at"
    t.bigint "integration_task_id"
    t.bigint "merchant_intake_id", null: false
    t.bigint "offer_id"
    t.datetime "started_at"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["advertiser_id"], name: "index_automation_runs_on_advertiser_id"
    t.index ["integration_task_id"], name: "index_automation_runs_on_integration_task_id"
    t.index ["merchant_intake_id"], name: "index_automation_runs_on_merchant_intake_id"
    t.index ["offer_id"], name: "index_automation_runs_on_offer_id"
  end

  create_table "integration_tasks", force: :cascade do |t|
    t.string "advertiser_external_id"
    t.string "asana_task_gid"
    t.datetime "created_at", null: false
    t.text "integration_notes"
    t.string "merchant_name"
    t.string "offer_external_id"
    t.string "status"
    t.string "tracking_method"
    t.datetime "updated_at", null: false
  end

  create_table "merchant_intakes", force: :cascade do |t|
    t.string "contact_email"
    t.string "contact_name"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "currency"
    t.string "google_doc_id"
    t.string "google_doc_url"
    t.text "integration_notes"
    t.string "merchant_name"
    t.string "offer_name"
    t.string "payout_amount"
    t.string "payout_type"
    t.text "raw_text"
    t.string "status"
    t.string "tracking_method"
    t.datetime "updated_at", null: false
    t.text "validation_errors"
    t.string "vertical"
    t.string "website"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "advertiser_id", null: false
    t.datetime "created_at", null: false
    t.string "offer_external_id"
    t.string "offer_name"
    t.string "payout_amount"
    t.string "payout_type"
    t.string "tracking_method"
    t.datetime "updated_at", null: false
    t.index ["advertiser_id"], name: "index_offers_on_advertiser_id"
  end

  add_foreign_key "automation_runs", "advertisers"
  add_foreign_key "automation_runs", "integration_tasks"
  add_foreign_key "automation_runs", "merchant_intakes"
  add_foreign_key "automation_runs", "offers"
  add_foreign_key "offers", "advertisers"
end
