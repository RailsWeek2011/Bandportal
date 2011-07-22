class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :userable, :polymorphic => true
      t.references :group

      t.timestamps
    end
    add_index :memberships, :group_id
  end
end
