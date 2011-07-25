class InstrumentsMemberships < ActiveRecord::Base
  belongs_to :instrument
  belongs_to :membership
end
