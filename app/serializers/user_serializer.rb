class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image
  has_many :projects
  has_many :tasks
end