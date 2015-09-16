require 'bcrypt'

class User < ActiveRecord::Base
	require "digest"
  include BCrypt

	before_save :encrypt_password, :lowercase_email
  before_update :encrypt_password

  has_many :tweets

  has_many :user_like_tweets
  has_many :liked_tweets, through: :user_like_tweets, source: :tweet

 	validates :email, :presence => true,
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
                    :uniqueness => { case_sensitive: false}

 	validates_presence_of :first_name
  validates_presence_of :last_name
  validates_length_of :password, minimum: 6
  has_secure_password


	attr_accessor :password

	def encrypt_password
    pass = password + "banana"
    self.encrypted_password = Digest::MD5.hexdigest pass
	end

  def lowercase_email
    self.email = email.downcase
  end
end
