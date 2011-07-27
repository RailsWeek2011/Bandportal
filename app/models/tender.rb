class Tender < ActiveRecord::Base
  belongs_to :event

  has_many :candidatures
  has_many :artist_groups, :through => :candidatures
end
