class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :status
  # has_many :user_tasks
  belongs_to :project
  belongs_to :user
end