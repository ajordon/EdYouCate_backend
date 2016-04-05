class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :classroom, :comments
  has_one :user
  has_many :assignments
end
