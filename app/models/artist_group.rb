class ArtistGroup < ActiveRecord::Base
  has_many :fan_groups

  has_one :group, :as => :groupable
  has_many  :memberships, :through => :groups
end
