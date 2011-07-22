class UnregisteredUser < ActiveRecord::Base
  has_many :memberships, :as => :userable
  has_many :groups, :through => :memberships

  validates :name, :presence => true
  validates :prename, :presence => true
end
