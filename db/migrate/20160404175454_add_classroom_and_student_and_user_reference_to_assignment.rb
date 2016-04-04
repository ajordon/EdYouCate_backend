class AddClassroomAndStudentAndUserReferenceToAssignment < ActiveRecord::Migration
  def change
    add_reference :assignments, :student, index: true
    add_reference :assignments, :classroom, index: true
    add_reference :assignments, :user, column: :created_by
  end
end
