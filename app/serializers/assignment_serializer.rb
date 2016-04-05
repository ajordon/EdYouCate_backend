class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :comments, :grade, :due_date, :classroom_id, :student_id
  # has_one :user
end
