FactoryGirl.define do
  factory :tweet do
    association :user
    text { FFaker::Lorem.characters(130) }
  end

end
