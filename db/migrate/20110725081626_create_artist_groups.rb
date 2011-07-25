class CreateArtistGroups < ActiveRecord::Migration
  def change
    create_table :artist_groups do |t|

      t.timestamps
    end
  end
end
