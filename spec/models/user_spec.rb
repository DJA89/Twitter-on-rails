require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'validations' do
    it { should have_many(:tweets) }

    it 'is a duplicate email adress' do
      u = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:user, email: u.email)).to_not be_valid
    end

    it 'has short password' do
      expect(FactoryGirl.build(:user, password: FFaker::Internet.password(1, 5))).to_not be_valid
    end

    it 'has got no email' do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it 'should have email format' do
      expect(FactoryGirl.build(:user, email: FFaker::Lorem.word)).to_not be_valid
    end

    it 'should have a first name' do
      expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
    end

    it 'should have last_name' do
      expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
    end

    it 'should have password' do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end

    it 'should be valid' do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it {should have_many(:user_like_tweets)}


  end

end
