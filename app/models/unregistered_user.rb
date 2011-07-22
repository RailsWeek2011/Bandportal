class UnregisteredUser < ActiveRecord::Base
  has_many :memberships, :as => :userable
  has_many :groups, :through => :memberships
end
