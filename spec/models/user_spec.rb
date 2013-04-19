require 'spec_helper'

describe User do
  describe "validations" do
    before :each do
      @user = FactoryGirl.build(:user)
    end

    after :each do
      @user = nil
    end

    it "should be valid with a valid email" do
      @user.should be_valid
      @user.errors[:email].should be_blank
    end

    it "should not be valid without an email" do
      @user.email = nil
      @user.should_not be_valid
      @user.errors[:email].should_not be_blank
    end

    it "should not be valid with a bogus email" do
      @user.email = "bogus email"
      @user.should_not be_valid
      @user.errors[:email].should_not be_blank
    end
  end

  describe "preferences" do
    before :all do
      @user = FactoryGirl.build(:user)
    end

    after :all do
      @user = nil
    end

    it "should be able to store a hash of preferences" do
      @user.preferences = { theme: "black", language: "US English", currency: "USD" }
      lambda {
        @user.should be_valid
        @user.save
      }.should change(User, :count).by(1)
    end
  end
end
