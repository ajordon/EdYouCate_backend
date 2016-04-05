class ClassroomSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_many :students
  has_many :assignments
end
