class Group < ActiveRecord::Base
  belongs_to :groupable, :polymorphic => true

  has_many :memberships

  validates :name, :presence => true

  def members
    self.memberships.collect do |m| m.userable end
  end
end
