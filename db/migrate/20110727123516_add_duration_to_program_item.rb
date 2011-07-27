class AddDurationToProgramItem < ActiveRecord::Migration
  def change
    add_column :program_items, :duration, :float
  end
end
