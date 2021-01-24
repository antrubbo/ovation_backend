class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :picture
end
