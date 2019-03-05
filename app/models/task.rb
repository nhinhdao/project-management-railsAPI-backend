class Task < ApplicationRecord
  enum status: [:active, :completed]
  has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :project
  validates :content, presence: true
end
