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

ActiveRecord::Schema.define(version: 20150601152941) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "micropost_id", limit: 4
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.string   "attachment",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50,    default: ""
    t.text     "comment",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.integer  "user_id",          limit: 4
    t.string   "role",             limit: 255,   default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "descreption", limit: 65535
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
  end

  create_table "events_groups", id: false, force: :cascade do |t|
    t.integer "event_id", limit: 4
    t.integer "group_id", limit: 4
  end

  add_index "events_groups", ["event_id"], name: "index_events_groups_on_event_id", using: :btree
  add_index "events_groups", ["group_id"], name: "index_events_groups_on_group_id", using: :btree

  create_table "groupings", force: :cascade do |t|
    t.integer "group_id",     limit: 4
    t.integer "micropost_id", limit: 4
  end

  add_index "groupings", ["group_id"], name: "index_groupings_on_group_id", using: :btree
  add_index "groupings", ["micropost_id"], name: "index_groupings_on_micropost_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "capacity",    limit: 4
    t.string   "passcode",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "groups_microposts", id: false, force: :cascade do |t|
    t.integer "micropost_id", limit: 4
    t.integer "group_id",     limit: 4
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.integer "group_id", limit: 4
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id",   limit: 4
    t.integer "group_id",  limit: 4
    t.boolean "owner",     limit: 1, default: false
    t.integer "new_count", limit: 4, default: 0
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "microposts", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "picture",      limit: 255
    t.text     "content_html", limit: 65535
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.string   "follower_id", limit: 255
    t.string   "followed_id", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "email",             limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.string   "avatar",            limit: 255
    t.boolean  "admin",             limit: 1,   default: false
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",         limit: 1
    t.datetime "activated_at"
    t.string   "type",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "microposts", "users"
end
