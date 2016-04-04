class AddForeignKeys < ActiveRecord::Migration
  def change
    rename_column :classrooms, :users_id, :user_id

    add_foreign_key :assignments, :classrooms
    add_foreign_key :assignments, :students
    add_foreign_key :assignments, :users

    add_foreign_key :classrooms, :users
  end
end
