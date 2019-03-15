class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :image, default: 'https://i.imgur.com/NbwnI6C.jpg'
      t.string :password_digest

      t.timestamps
    end
  end
end
