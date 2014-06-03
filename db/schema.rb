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

ActiveRecord::Schema.define(version: 20140603122453) do

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

  create_table "content_pages", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "text"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_text"
    t.string   "url"
  end

  add_index "content_pages", ["slug"], name: "index_content_pages_on_slug", unique: true, using: :btree

  create_table "forums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "project_category_id"
  end

  add_index "forums", ["project_category_id"], name: "index_forums_on_project_category_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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
    t.string   "context"
  end

  add_index "posts", ["target_id", "target_type"], name: "index_posts_on_target_id_and_target_type", using: :btree

  create_table "project_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "project_categories", ["slug"], name: "index_project_categories_on_slug", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "image_uid"
    t.string   "image_name"
    t.integer  "user_id"
    t.text     "help_needed"
    t.text     "purpose"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.integer  "project_category_id"
    t.boolean  "feature_on_homepage"
    t.boolean  "feature_on_community_homepage"
  end

  add_index "projects", ["feature_on_community_homepage"], name: "index_projects_on_feature_on_community_homepage", using: :btree
  add_index "projects", ["feature_on_homepage"], name: "index_projects_on_feature_on_homepage", using: :btree
  add_index "projects", ["project_category_id"], name: "index_projects_on_project_category_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

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

  create_table "user_interests", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_interests", ["project_category_id"], name: "index_user_interests_on_project_category_id", using: :btree
  add_index "user_interests", ["user_id"], name: "index_user_interests_on_user_id", using: :btree

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
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "slug"
    t.string   "website"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
