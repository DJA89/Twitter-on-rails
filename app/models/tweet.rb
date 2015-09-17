class Tweet < ActiveRecord::Base

	belongs_to :user

  has_many :user_like_tweets
  has_many :like_users, through: :user_like_tweets, source: :user

	validates :text, :presence => true
	validates :user, :presence => true

  def liked_by(user)
    self.like_users << user
  end

  def unliked_by(user)
    self.like_users.delete(user)
  end
end
