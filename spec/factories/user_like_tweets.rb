FactoryGirl.define do
  factory :user_like_tweet do
    user  { FactoryGirl.create(:user) }
    tweet { FactoryGirl.create(:tweet) }
  end

end
