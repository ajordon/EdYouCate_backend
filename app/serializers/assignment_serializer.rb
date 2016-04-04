class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :comments, :grade, :due_date, :student
end
