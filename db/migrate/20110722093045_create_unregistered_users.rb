class CreateUnregisteredUsers < ActiveRecord::Migration
  def change
    create_table :unregistered_users do |t|
      t.string :prename
      t.string :surname

      t.timestamps
    end
  end
end
