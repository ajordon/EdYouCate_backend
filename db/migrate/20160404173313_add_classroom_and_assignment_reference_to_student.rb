class AddClassroomAndAssignmentReferenceToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :classroom, index: true, foreign_key: true
    add_reference :students, :assignment, index: true, foreign_key: true
  end
end
