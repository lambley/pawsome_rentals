class AddDefaultValueToIsOwnerInUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_owner, :boolean, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
