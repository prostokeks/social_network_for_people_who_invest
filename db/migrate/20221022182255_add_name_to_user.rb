class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, default: "User", null: false
    add_column :users, :last_name, :string
    add_column :users, :about, :string
    add_column :users, :phone, :string
    add_column :users, :work_group, :string, default: "User", null: false
    add_column :users, :gender, :string
    add_column :users, :birthday, :string
  end
end
