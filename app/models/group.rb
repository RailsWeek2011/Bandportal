class Group < ActiveRecord::Base
  has_many :memberships
  #has_many :users, :through => :memberships

  def members
    self.memberships.collect do |m| m.userable end
  end
end
