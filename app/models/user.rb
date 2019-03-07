class User < ApplicationRecord
  #User can have many projects as an owner
  has_many :projects, dependent: :delete_all, foreign_key: :owner_id
  #user can have many tasks as assigned tasks
  has_many :tasks

  validates :username, :email, :image, :password, :password_confirmation, presence: true
  has_secure_password
end
