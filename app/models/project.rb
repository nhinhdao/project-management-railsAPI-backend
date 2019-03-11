class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :tasks, dependent: :delete_all

  validates :title, :description, :start_date, :end_date, presence: true
end

# Project.create(name: 'New Project', description: 'Test user', start_date: '2019/03/02', end_date: '2019-03-10', owner_id: 2)
# Task.create(content: 'User create-react-app', project_id: Project.first.id)
# UserTask.create(user_id: a.id, task_id: Task.first.id)
#Project.joins(:tasks).where(tasks: {user_id: 1})
# Project.where(owner_id: 1) + Project.joins(:tasks).where(tasks: {user_id: 1})