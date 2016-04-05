class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :comments, :grade, :due_date, :student
  has_one :user
  has_one :classroom
end
