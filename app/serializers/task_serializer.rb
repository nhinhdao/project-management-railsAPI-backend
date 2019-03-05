class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :status
  # has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :project
end