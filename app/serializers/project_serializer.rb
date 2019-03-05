class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_date, :end_date, :status
  belongs_to :owner, class_name: 'User'
  has_many :tasks
end