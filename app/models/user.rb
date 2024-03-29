class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  has_many :surveys

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { with: VALID_EMAIL_REGEX },
                    :uniqueness => { case_sensitive: false }

  validates :password, :presence => true, :on => :create
  validates :password_confirmation, :presence => true

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
