class Tweet < ActiveRecord::Base

	belongs_to :user

  has_many :user_like_tweets
  has_many :like_users, through: :user_like_tweets, source: :user

	validates_presence_of :text
	validates_presence_of :user

  def liked_by(user)
    self.like_users << user
  end

  def unliked_by(user)
    self.like_users.delete(user)
  end
end
