#
class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :name, :school
end
