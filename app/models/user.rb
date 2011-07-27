class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nick, :prename, :name,
                  :street, :zip, :city, :homepage, :about, :host, :artist,
                  :show_name, :show_email, :show_street, :show_city

  validates :nick, :presence => true

  has_many :memberships, :as => :userable
  has_many :groups, :through => :memberships
  has_many :recieved_messages, :foreign_key => :recipient_id, :class_name => 'Message'
  has_many :sent_messages, :foreign_key => :sender_id, :class_name => 'Message'
end
