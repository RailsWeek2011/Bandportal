class AddNameToUnregisteredUser < ActiveRecord::Migration
  def change
    add_column :unregistered_users, :name, :string
  end
end
