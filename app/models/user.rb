class User < ActiveRecord::Base

  has_many :orders
  has_many :shipping_addresses
  has_many :addresses, through: :shipping_addresses
  
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

  has_attached_file :thumbnail, url: "user/:id.:extension",
                path: "public/images/user/:id.:extension"
  validates_attachment_content_type :thumbnail, :content_type => %w(image/jpeg image/jpg image/png)

  def employee?
    self.role == 'employee'
  end

  def customer?
    role == 'customer'
  end
  
end
