class User < ActiveRecord::Base
	require "digest"
	before_save :encrypt_password
  before_update :encrypt_password

  has_many :tweets

 	validates :email, :presence => true,
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
                    :uniqueness => true

 	validates_presence_of :first_name
  validates_presence_of :last_name
  validates_length_of :password, minimum: 6



	attr_accessor :password

	def encrypt_password
    self.encrypted_password = Digest::MD5.hexdigest password
	end
end
