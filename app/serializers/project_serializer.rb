class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :end_date
  belongs_to :owner, class_name: 'User'
  has_many :tasks
end