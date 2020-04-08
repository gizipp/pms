class InitSchema < ActiveRecord::Migration[6.0]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    create_table "attachments" do |t|
      t.string "attachable_type"
      t.bigint "attachable_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "attachment"
      t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
    end
    create_table "comments" do |t|
      t.integer "user_id"
      t.text "body"
      t.bigint "task_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["task_id"], name: "index_comments_on_task_id"
    end
    create_table "contributors" do |t|
      t.integer "user_id"
      t.integer "work_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    create_table "tasks" do |t|
      t.integer "user_id"
      t.date "due_date"
      t.string "name"
      t.string "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.boolean "status", default: false
      t.integer "todo_list_id"
    end
    create_table "todo_lists" do |t|
      t.string "name"
      t.string "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "id_work"
      t.integer "work_id"
    end
    create_table "users" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip"
      t.string "last_sign_in_ip"
      t.string "name"
      t.string "username"
      t.string "role"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "avatar"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
      t.index ["username"], name: "index_users_on_username", unique: true
    end
    create_table "works" do |t|
      t.string "title"
      t.text "description"
      t.integer "user_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
