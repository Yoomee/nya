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

ActiveRecord::Schema.define(version: 20140521161715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "context"
    t.boolean  "read",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["resource_id", "resource_type"], name: "index_notifications_on_resource_id_and_resource_type", using: :btree
  add_index "notifications", ["user_id", "read", "context"], name: "index_notifications_on_user_id_and_read_and_context", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.text     "text"
    t.string   "image_uid"
    t.string   "video_url"
    t.string   "video_title"
    t.text     "video_description"
    t.string   "file_uid"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["target_id", "target_type"], name: "index_posts_on_target_id_and_target_type", using: :btree

  create_table "redactor_uploads", force: true do |t|
    t.string   "file_uid"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio"
    t.string   "role"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end