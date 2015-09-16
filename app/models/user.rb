class User < ActiveRecord::Base

  before_save :encrypt_password, :lowercase_email
  before_update :encrypt_password, :lowercase_email

  has_many :tweets

  has_many :user_like_tweets
  has_many :liked_tweets, through: :user_like_tweets, source: :tweet

  validates :email, :presence => true,
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
                    :uniqueness => { case_sensitive: false}

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :password, length: { minimum: 6 },
                       presence: true
  has_secure_password




  def encrypt_password
    pass = password + "banana"
    self.password_digest = Digest::MD5.hexdigest pass
  end

  def lowercase_email
    self.email = email.downcase
  end
end
