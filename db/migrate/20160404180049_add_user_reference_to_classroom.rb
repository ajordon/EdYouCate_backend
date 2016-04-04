class AddUserReferenceToClassroom < ActiveRecord::Migration
  def change
    add_reference :classrooms, :users
  end
end
