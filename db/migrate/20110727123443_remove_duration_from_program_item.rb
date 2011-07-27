class RemoveDurationFromProgramItem < ActiveRecord::Migration
  def up
    remove_column :program_items, :duration
  end

  def down
    add_column :program_items, :duration, :time
  end
end
