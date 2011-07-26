class HostGroup < ActiveRecord::Base
  has_one :group, :as => :groupable
  has_many  :memberships, :through => :groups
end
