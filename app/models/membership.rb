class Membership < ActiveRecord::Base
  belongs_to :userable, :polymorphic => true
  belongs_to :group

  has_and_belongs_to_many :instruments

  def groups
    self.groups.collect do |g| g.groupable end
  end
end
