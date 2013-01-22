class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :posts
  has_many :posts
  has_secure_password
  
  before_save :create_remember_token
  
  private 
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
