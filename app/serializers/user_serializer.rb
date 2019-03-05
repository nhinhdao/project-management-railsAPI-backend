class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image
  has_many :projects
  # has_many :user_tasks
  has_many :tasks, through: :user_tasks
end