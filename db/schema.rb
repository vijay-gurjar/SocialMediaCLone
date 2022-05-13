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

ActiveRecord::Schema[7.0].define(version: 2022_04_30_093215) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "member_id"
    t.index ["subject_id"], name: "index_comments_on_subject_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id", "subject_id"], name: "index_likes_on_member_id_and_subject_id", unique: true
    t.index ["member_id"], name: "index_likes_on_member_id"
    t.index ["subject_id"], name: "index_likes_on_subject_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.string "unlock_token"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_members_on_unlock_token", unique: true
  end

  create_table "members_roles", id: false, force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "role_id"
    t.index ["member_id", "role_id"], name: "index_members_roles_on_member_id_and_role_id"
    t.index ["member_id"], name: "index_members_roles_on_member_id"
    t.index ["role_id"], name: "index_members_roles_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "first_name"
    t.string "last_name"
    t.index ["member_id"], name: "index_subjects_on_member_id"
  end

  add_foreign_key "comments", "subjects"
  add_foreign_key "likes", "members"
  add_foreign_key "likes", "subjects"
  add_foreign_key "subjects", "members"
end
