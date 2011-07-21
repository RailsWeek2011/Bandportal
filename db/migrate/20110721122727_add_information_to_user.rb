class AddInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
    add_column :users, :prename, :string
    add_column :users, :name, :string
    add_column :users, :street, :string
    add_column :users, :zip, :string
    add_column :users, :city, :string
    add_column :users, :homepage, :string
    add_column :users, :about, :text
  end
end
