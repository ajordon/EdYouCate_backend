class ClassroomSerializer < ActiveModel::Serializer
  attributes :id, :name, :user
  has_one :user
  has_many :students
  has_many :assignments
end
