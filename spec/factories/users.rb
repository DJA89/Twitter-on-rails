FactoryGirl.define do
  require 'ffaker'
  factory :user do
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    email {FFaker::Internet.email}
    password {FFaker::Internet.password(6, 99)}
    password_confirmation {password}
  end
end
