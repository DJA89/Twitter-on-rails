class UserLikeTweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet

  validates_presence_of :user
  validates_presence_of :tweet
end
