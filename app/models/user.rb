class User < ActiveRecord::Base

  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :password, presence: true, on: :create
  validates :password, length: { minimum: 4 }, on: :create
  before_save :encrypt_password

  scope(:where_admin, -> do
    where({:admin => true})
  end)

  scope(:where_not_admin, -> do
    where({:admin => false})
  end)

  scope(:is_best, -> do
    where({:best => true})
  end)

  scope(:is_not_best, -> do
    where({:best => false})
  end)

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
