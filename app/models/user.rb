class User < ActiveRecord::Base

  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :password, presence: true
  validates :password, length: { minimum: 4 }
  before_save :encrypt_password

  def encrypt_password
    self.salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
end
