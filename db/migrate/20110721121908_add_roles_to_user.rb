class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :artist, :boolean, :default => false
    add_column :users, :host, :boolean, :default => false
  end
end
