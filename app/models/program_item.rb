class ProgramItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :artist_group
end
