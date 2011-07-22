class RemoveSurnameFromUnregisteredUser < ActiveRecord::Migration
  def up
    remove_column :unregistered_users, :surname
  end

  def down
    add_column :unregistered_users, :surname, :string
  end
end
