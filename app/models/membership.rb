class Membership < ActiveRecord::Base
  belongs_to :userable, :polymorphic => true
  belongs_to :group
end
