class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :content
      t.integer :status, default: 0
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
