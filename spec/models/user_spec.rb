require 'rails_helper'


RSpec.describe User, type: :model do


	it 'is a duplicate email adress' do
		
		u = FactoryGirl.create(:user)
		FactoryGirl.create(:user, email: u.email).should_not be_valid

		
	end

	it 'has short password' do
		FactoryGirl.create(:user, password: FFaker::Internet.password(1, 5)).should_not be_valid
	end

	it 'has got no email' do

    create(:user, email: nil).should_not be_valid

	end

  it 'should have email format' do

    create(:user, email: FFaker::Lorem.word).should_not be_valid

  end

  it 'should have a first name' do

    create(:user, first_name: nil).should_not be_valid

  end

  it 'should have last_name' do

    create(:user, last_name: nil).should_not be_valid

  end

  it 'should have password' do

    create(:user, password: nil).should_not be_valid

  end




end
