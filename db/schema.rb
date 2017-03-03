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

ActiveRecord::Schema.define(version: 20170303181149) do

  create_table "age_clusters", force: :cascade do |t|
    t.integer "from_12_to_18_count"
    t.integer "from_18_to_21_count"
    t.integer "from_21_to_24_count"
    t.integer "from_24_to_27_count"
    t.integer "from_27_to_30_count"
    t.integer "from_30_to_35_count"
    t.integer "from_35_to_45_count"
    t.integer "from_45_to_100_count"
  end

  create_table "group_posts", force: :cascade do |t|
    t.text     "text"
    t.integer  "likes_count"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "theme_id"
    t.integer  "group_stat_id"
    t.index ["group_stat_id"], name: "index_group_posts_on_group_stat_id"
    t.index ["theme_id"], name: "index_group_posts_on_theme_id"
  end

  create_table "group_stats", force: :cascade do |t|
    t.datetime "day"
    t.integer  "unique_visitors_count"
    t.integer  "subscribed_count"
    t.integer  "unsubcribed_count"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "group_id"
    t.integer  "age_cluster_id"
    t.index ["age_cluster_id"], name: "index_group_stats_on_age_cluster_id"
    t.index ["group_id"], name: "index_group_stats_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "photo_link"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.string   "stat_job_status"
    t.string   "stat_job_id"
    t.string   "posts_job_status"
    t.string   "posts_job_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_themes_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end