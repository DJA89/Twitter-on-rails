require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    it 'should not save user' do
       user_params = {
                first_name: "",
                last_name: "joi",
                email: "user@example",
                password: "ere",
                password_confirmation: "rer"
              }
      expect{ post :create, user: user_params }.to_not change{User.count}
    end

    it 'should sasve user' do
      user_params = {
                first_name: FFaker::Name.first_name,
                last_name: FFaker::Name.last_name,
                email: FFaker::Internet.email,
                password: "lararara",
                password_confirmation: "lararara"
      }


      expect{ post :create, user: user_params }.to change{User.count}.by(1)
    end
end
