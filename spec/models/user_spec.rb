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

    it "requires the phone attr to only have 10 letters" do
      @user.phone = '123456789'
      expect(@user).to_not be_valid
    end

    it "requires ssn attr to only have 10 letters" do
      @user.ssn = '123456789'
      expect(@user).to_not be_valid
    end

    it "requires ssn attr to only have 10 letters" do
      @user.ssn = '123456789'
      expect(@user).to_not be_valid
    end

    it "requires ssn attr" do
      @user.ssn = nil
      expect(@user).to_not be_valid
    end

    it "requires company" do
      @user.company = nil
      expect(@user).to_not be_valid
    end

  end

  describe 'employee-manager' do
    let!(:employee_1) { create :user }
    let!(:employee_2) { create :user }
    let!(:admin) { create :admin_user }
    it 'allows admin to be connected to many employees' do
      Hand.create!(user_id: admin.id, hand_id: employee_1.id)
      Hand.create!(user_id: admin.id, hand_id: employee_2.id)
      expect(admin.hands.count).to eq(2)
    end
  end

  describe "custom name methods" do
    it 'has a full name method that joins first and last name' do
      expect(@user.full_name).to eq("DOE, JOE")
    end
  end
end
