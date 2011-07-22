class AddShowboolsToUser < ActiveRecord::Migration
  def change
    add_column :users, :show_name, :boolean, :default => false
    add_column :users, :show_email, :boolean, :default => false
    add_column :users, :show_street, :boolean, :default => false
    add_column :users, :show_city, :boolean, :default => false
  end
end
