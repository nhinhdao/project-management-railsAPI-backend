class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0
      t.integer :owner_id

      t.timestamps
    end
  end
end
