class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :body
      t.string :image_path

      t.timestamps
    end
  end
end
