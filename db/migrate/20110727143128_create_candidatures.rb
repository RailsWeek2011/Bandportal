class CreateCandidatures < ActiveRecord::Migration
  def change
    create_table :candidatures do |t|
      t.references :tender
      t.references :artist_group
      t.text :description

      t.timestamps
    end
    add_index :candidatures, :tender_id
    add_index :candidatures, :artist_group_id
  end
end
