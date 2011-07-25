class CreateInstrumentsMemberships < ActiveRecord::Migration
  def change
    create_table :instruments_memberships, :id => false do |t|
      t.references :instrument
      t.references :membership

      t.timestamps
    end
    add_index :instruments_memberships, :instrument_id
    add_index :instruments_memberships, :membership_id
  end
end
