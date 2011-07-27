class Message < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :sender_id, :class_name => 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, :class_name => 'User'

  validates :subject, :presence => true


  def undelete!
    sender_undelete!
    recipient_undelete!
  end

  def sender_undelete!
    self.sender_deleted = false
    self.save
  end

  def recipient_undelete!
    self.recipient_deleted = false
    self.save
  end
end
