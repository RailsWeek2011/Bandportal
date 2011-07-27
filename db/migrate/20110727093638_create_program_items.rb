class CreateProgramItems < ActiveRecord::Migration
  def change
    create_table :program_items do |t|
      t.references :event
      t.references :artist_group
      t.datetime :begin
      t.time :duration

      t.timestamps
    end
    add_index :program_items, :event_id
    add_index :program_items, :artist_group_id
  end
end
