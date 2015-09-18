class User < ActiveRecord::Base

  before_save :encrypt_password, :lowercase_email

  has_many :tweets

  has_many :user_like_tweets
  has_many :liked_tweets, through: :user_like_tweets, source: :tweet

  validates :email, :presence => true,
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
                    :uniqueness => { case_sensitive: false}

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, length: { minimum: 6 },
                       presence: true
  has_secure_password

  attr_accessor :remember_token

  def encrypt_password
    pass = password + "banana"
    pass = BCrypt::Password.create(pass)
    self.password_digest = BCrypt::Password.new(pass)
  end

  def lowercase_email
    self.email = email.downcase
  end

  def new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = new_token
    update_column(:remember_digest, BCrypt::Password.create(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
