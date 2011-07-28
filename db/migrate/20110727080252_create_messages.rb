class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender
      t.references :recipient
      t.boolean :sender_deleted, :default => false
      t.boolean :recipient_deleted, :default => false
      t.boolean :read, :default => false
      t.string :subject
      t.text :message

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :recipient_id
  end
end
