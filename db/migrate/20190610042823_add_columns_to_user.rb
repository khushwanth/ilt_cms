class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :designation, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
  end
end
