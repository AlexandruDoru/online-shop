class User < ActiveRecord::Base

  has_one :order

  has_secure_password

  before_save { self.email.downcase! }

  validates :firstname, :presence => true
  validates :firstname, :length => { :maximum => 60 }

  validates :lastname, :presence => true
  validates :lastname, :length => { :maximum => 60 }

  validates :password, length: { minimum: 6 }, :if => :password_digest_changed?
  validates :password_confirmation, :presence => true, :if => '!password.nil?'

  validates :email, :presence => true
  validates :email, :length => { :maximum => 100 }
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
