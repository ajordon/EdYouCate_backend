class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :classroom, :comments, :classroom_id
  has_many :assignments
end
