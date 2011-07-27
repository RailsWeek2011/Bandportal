class ArtistGroup < ActiveRecord::Base
  has_many :fan_groups

  has_one :group, :as => :groupable
  has_many  :memberships, :through => :groups

  has_many :program_items
  has_many :events, :through => :program_items

  has_many :candidatures
  has_many :tenders, :through => :candidatures
end
