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

ActiveRecord::Schema.define(version: 20160622081843) do

  create_table "gzh_configs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "shop_id"
    t.string   "appid"
    t.string   "token"
    t.string   "refresh_token"
    t.boolean  "del",           default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["shop_id"], name: "index_gzh_configs_on_shop_id", using: :btree
  end

  create_table "gzh_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "gzh_config_id"
    t.integer  "shop_id"
    t.string   "nickname"
    t.string   "headimgurl"
    t.integer  "service_type"
    t.integer  "verify_type"
    t.string   "alias"
    t.string   "user_name"
    t.string   "qrcode_url"
    t.boolean  "open_store",    default: false
    t.boolean  "open_scan",     default: false
    t.boolean  "open_pay",      default: false
    t.boolean  "open_card",     default: false
    t.boolean  "open_shake",    default: false
    t.boolean  "del",           default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["gzh_config_id"], name: "index_gzh_infos_on_gzh_config_id", using: :btree
    t.index ["shop_id"], name: "index_gzh_infos_on_shop_id", using: :btree
  end

  create_table "img_media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "gzh_config_id"
    t.string   "media_id"
    t.string   "title"
    t.string   "introduction"
    t.string   "url"
    t.string   "local_url"
    t.boolean  "del",           default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["gzh_config_id"], name: "index_img_media_on_gzh_config_id", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.integer  "api_user_id"
    t.string   "name"
    t.string   "image_path"
    t.boolean  "del",         default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["shop_id"], name: "index_members_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "new_media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "gzh_config_id"
    t.integer  "img_medium_id"
    t.string   "title"
    t.string   "media_id"
    t.string   "thumb_url"
    t.boolean  "show_cover_pic",                   default: false
    t.string   "author"
    t.string   "digest"
    t.text     "content",            limit: 65535
    t.string   "url"
    t.string   "content_source_url"
    t.boolean  "del",                              default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["gzh_config_id"], name: "index_new_media_on_gzh_config_id", using: :btree
    t.index ["img_medium_id"], name: "index_new_media_on_img_medium_id", using: :btree
  end

  create_table "scan_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "shop_id"
    t.integer  "user_id"
    t.string   "image_path"
    t.string   "randCode"
    t.string   "pic_url"
    t.boolean  "del",        default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "media_id"
    t.index ["shop_id"], name: "index_scan_records_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_scan_records_on_user_id", using: :btree
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "shop_id"
    t.string   "openid"
    t.string   "nickname"
    t.boolean  "sex"
    t.string   "city"
    t.string   "country"
    t.string   "province"
    t.string   "language"
    t.string   "headimgurl"
    t.integer  "subscribe_time"
    t.boolean  "del",            default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "gzh_config_id"
    t.index ["gzh_config_id"], name: "index_users_on_gzh_config_id", using: :btree
    t.index ["shop_id"], name: "index_users_on_shop_id", using: :btree
  end

end
