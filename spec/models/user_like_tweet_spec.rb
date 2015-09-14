require 'rails_helper'

RSpec.describe UserLikeTweet, type: :model do

  describe 'validations' do
    it {should belong_to :user}
    it {should belong_to :tweet}
  end
end
