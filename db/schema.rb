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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130130201825) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "type"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "name"
    t.string   "phone_number"
  end

  add_index "addresses", ["addressable_id"], :name => "index_addresses_on_addressable_id"
  add_index "addresses", ["addressable_type"], :name => "index_addresses_on_addressable_type"

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coupons", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "quantity"
    t.string   "coupon_type"
    t.string   "discount_type"
    t.integer  "amount"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "generated_by_order_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.string   "status"
    t.string   "phone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customizations", :force => true do |t|
    t.string   "lapel"
    t.integer  "buttons"
    t.integer  "vents"
    t.integer  "pleats"
    t.boolean  "pant_cuffs"
    t.string   "fit"
    t.integer  "lining"
    t.string   "monogram"
    t.boolean  "bouttoniere"
    t.boolean  "pick_stitching"
    t.integer  "vest_buttons"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "vest"
    t.string   "collar"
    t.boolean  "pocket"
    t.string   "monogram_color"
    t.string   "product_category"
    t.string   "fabric"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "customization_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], :name => "index_line_items_on_cart_id"
  add_index "line_items", ["customization_id"], :name => "index_line_items_on_customization_id"
  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "measurements", :force => true do |t|
    t.decimal  "neck"
    t.decimal  "full_shoulders"
    t.decimal  "front"
    t.decimal  "back"
    t.decimal  "chest"
    t.decimal  "stomach"
    t.decimal  "waist"
    t.decimal  "arm_length"
    t.decimal  "jacket_length"
    t.decimal  "bicep"
    t.decimal  "wrist"
    t.decimal  "hips"
    t.decimal  "crotch"
    t.decimal  "thigh"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.decimal  "pant_length"
    t.integer  "order_id"
  end

  add_index "measurements", ["order_id"], :name => "index_measurements_on_order_id"
  add_index "measurements", ["user_id"], :name => "index_measurements_on_user_id"

  create_table "orders", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.string   "stripe_charge_id"
    t.integer  "coupon_id"
    t.decimal  "discount"
    t.decimal  "final_cost"
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "potential_users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.string   "description",       :limit => 1000
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "image_large_url"
    t.string   "image_small_1_url"
    t.string   "image_small_2_url"
    t.string   "image_small_3_url"
    t.string   "image_small_4_url"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "summary"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "stripe_customer_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
