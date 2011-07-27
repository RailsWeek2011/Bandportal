class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nick, :prename, :name,
                  :street, :zip, :city, :homepage, :about,
                  :show_name, :show_email, :show_street, :show_city

  validates :nick, :presence => true

  has_many :memberships, :as => :userable
  has_many :groups, :through => :memberships
end
