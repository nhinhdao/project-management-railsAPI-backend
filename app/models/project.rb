class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :tasks, dependent: :delete_all

  enum status: [:not_started, :active, :completed, :dismissed]

  validates :name, :description, :start_date, :end_date, presence: true
end

# Project.create(name: 'React App', description: 'Make app for Project Management', time: '2019/03/02 12:00', owner_id: a.id)
# Task.create(content: 'User create-react-app', project_id: Project.first.id)
# UserTask.create(user_id: a.id, task_id: Task.first.id)