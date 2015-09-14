FactoryGirl.define do
  factory :tweet do
    user { FactoryGirl.create(:user)}
    text { FFaker::Lorem.characters(130) }
  end

end
