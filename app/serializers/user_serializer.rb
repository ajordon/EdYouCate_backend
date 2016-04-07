#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :school # , :can_edit

  # def can_edit
  #   # defaults to current user which may be nil
  #   scope ? scope == object : false
  # end
end
