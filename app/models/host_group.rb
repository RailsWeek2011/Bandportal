class HostGroup < ActiveRecord::Base
  has_one :group, :as => :groupable
  has_many :memberships, :through => :groups

  has_many :program_items
  has_many :events, :through => :program_items
end
