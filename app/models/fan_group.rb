class FanGroup < ActiveRecord::Base
  belongs_to :artist_group

  has_one :group, :as => :groupable
  has_many  :memberships, :through => :groups
end
