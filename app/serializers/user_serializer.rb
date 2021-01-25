class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :picture

  has_many :tickets
end
