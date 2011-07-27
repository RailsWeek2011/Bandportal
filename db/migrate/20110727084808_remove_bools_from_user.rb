class RemoveBoolsFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :host
    remove_column :users, :artist
  end

  def down
    add_column :users, :artist, :boolean
    add_column :users, :host, :boolean
  end
end
