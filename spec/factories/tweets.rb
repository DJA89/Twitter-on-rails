FactoryGirl.define do
  factory :tweet do
    user_id ""
	text {FFaker::Lorem.characters(130)}
  end

end
