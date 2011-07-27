class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :begin
      t.datetime :end
      t.references :host_group

      t.timestamps
    end
    add_index :events, :host_group_id
  end
end
