class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.date :date
      t.text :description
      t.boolean :ended, :default => false
      t.references :event

      t.timestamps
    end
    add_index :tenders, :event_id
  end
end
