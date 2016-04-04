class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title, null: false
      t.string :description
      t.string :comments
      t.integer :grade
      t.date :due_date

      t.timestamps null: false
    end
  end
end
