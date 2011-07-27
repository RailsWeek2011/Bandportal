class RemoveTimesFromProgramItem < ActiveRecord::Migration
  def up
    remove_column :program_items, :begin
    remove_column :program_items, :duration
  end

  def down
    add_column :program_items, :duration, :float
    add_column :program_items, :begin, :datetime
  end
end
