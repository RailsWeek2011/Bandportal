class Group < ActiveRecord::Base
  has_many :memberships

  validates :name, :presence => true

  def members
    self.memberships.collect do |m| m.userable end
  end
end
