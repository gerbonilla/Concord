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

ActiveRecord::Schema.define(version: 20170928111446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "brokerage_id"
    t.string "brokerage_name"
    t.integer "quovo_id"
    t.boolean "is_inactive"
    t.string "last_good_sync"
    t.string "nickname"
    t.string "opened"
    t.bigint "profile_id"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_accounts_on_profile_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.bigint "account_id"
    t.string "brokerage_name"
    t.string "description"
    t.integer "quovo_id"
    t.boolean "is_inactive"
    t.boolean "is_taxable"
    t.string "last_change"
    t.string "nickname"
    t.string "owner_type"
    t.string "portfolio_category"
    t.string "portfolio_name"
    t.string "portfolio_type"
    t.string "portfolio_type_confidence"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_portfolios_on_account_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "portfolio_id"
    t.string "asset_class"
    t.float "cost_basis"
    t.string "cost_basis_type"
    t.string "currency"
    t.string "cusip"
    t.float "fx_rate"
    t.integer "quovo_id"
    t.string "last_purchase_date"
    t.float "price"
    t.float "quantity"
    t.string "sector"
    t.string "security_type"
    t.string "security_type_confidence"
    t.string "ticker"
    t.string "ticker_name"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sac1"
    t.string "sac2"
    t.index ["portfolio_id"], name: "index_positions_on_portfolio_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "transfer_pin"
    t.string "language"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "portfolio_id"
    t.string "currency"
    t.string "cusip"
    t.string "date"
    t.string "expense_category"
    t.integer "fees_cents", default: 0, null: false
    t.string "fees_currency", default: "USD", null: false
    t.integer "fx_rate_cents", default: 0, null: false
    t.string "fx_rate_currency", default: "USD", null: false
    t.integer "quovo_id"
    t.boolean "is_cancel"
    t.boolean "is_pending"
    t.string "memo"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.float "quantity"
    t.string "ticker"
    t.string "ticker_name"
    t.string "tran_category"
    t.string "tran_type"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_transactions_on_portfolio_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "quovo_user_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "profiles"
  add_foreign_key "portfolios", "accounts"
  add_foreign_key "positions", "portfolios"
  add_foreign_key "profiles", "users"
  add_foreign_key "transactions", "portfolios"
end
