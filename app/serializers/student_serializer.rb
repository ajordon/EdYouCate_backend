class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_grade, :classroom, :comments
  has_one :user
end
