require 'rails_helper'

RSpec.describe Tweet, type: :model do

  describe 'validations' do
    
    it { should belong_to(:user) }

    it 'should have text' do

      tweet = build(:tweet, text: nil)

      expect(build(:user, tweets: [tweet])).to_not be_valid

    end

    it 'should have user' do

      expect(build(:tweet)).to_not be_valid

    end

  end

end
