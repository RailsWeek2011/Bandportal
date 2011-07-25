class CreateFanGroups < ActiveRecord::Migration
  def change
    create_table :fan_groups do |t|
      t.references :artist_group

      t.timestamps
    end
    add_index :fan_groups, :artist_group_id
  end
end
