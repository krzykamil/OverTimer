require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryGirl.create(:user)
    end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validations" do

    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
    it "cannot be created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it "requires the phone attr to only contain integers" do
      @user.phone = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it "required the phone attr to only have 10 letters" do
      @user.phone = '123456789'
      expect(@user).to_not be_valid
    end

  end


  describe "custom name methods" do
    it 'has a full name method that joins first and last name' do
      expect(@user.full_name).to eq("DOE, JOE")
    end
  end
end
