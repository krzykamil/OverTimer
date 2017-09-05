require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do #will be run before every test
      @user = User.create(email: "JoeDoe@gmail.com", password: "Ilovemywife", password_confirmation: "Ilovemywife", first_name: "Joe", last_name: "Doe") #TODO factories
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name and last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
