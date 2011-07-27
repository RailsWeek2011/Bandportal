class Candidature < ActiveRecord::Base
  belongs_to :tender
  belongs_to :artist_group
end
