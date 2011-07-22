class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :homepage

      t.references :groupable, :polymorphic => true

      t.timestamps
    end
  end
end
