class Task < ApplicationRecord
  enum status: [:active, :completed]
  belongs_to :user
  belongs_to :project
  validates :content, presence: true
end
