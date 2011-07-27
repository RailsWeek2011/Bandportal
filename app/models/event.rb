class Event < ActiveRecord::Base
  belongs_to :host_group

  has_many :program_items
  has_many :artist_groups, :through => :program_items

end
