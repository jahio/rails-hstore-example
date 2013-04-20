require 'spec_helper'

describe UsersController do
  describe "security" do
    before :each do
      @user = FactoryGirl.build(:user)
    end

    after :each do
      @user.destroy
    end

    it "create shouldn't take unspecified keys" do
      @user.preferences["l33th4x0rlol"] = "ugoth4x0r3d"
      post :create, :user => @user.attributes
      User.last.preferences["l33th4x0rlol"].should be_blank
    end

    it "create should take valid keys" do
      @user.preferences["theme"] =    User.valid_themes.sample
      @user.preferences["language"] = User.valid_languages.sample
      @user.preferences["currency"] = User.valid_currencies.sample
      post :create, :user => @user.attributes
      User.last.preferences["theme"].should_not be_blank
      User.last.preferences["language"].should_not be_blank
      User.last.preferences["currency"].should_not be_blank
    end

    it "update shouldn't take unspecified keys" do
      @user.save && @user.reload
      @user.preferences["l33th4x0rlol"] = "ugoth4x0r3d"
      put :update, :id => @user.id, :user => @user.attributes
      User.last.preferences["l33th4x0rlol"].should be_blank
    end

    it "update should take valid keys" do
      @user.save && @user.reload
      @user.preferences["theme"] =    User.valid_themes.sample
      @user.preferences["language"] = User.valid_languages.sample
      @user.preferences["currency"] = User.valid_currencies.sample
      put :update, :id => @user.id, :user => @user.attributes
      User.last.preferences["theme"].should_not be_blank
      User.last.preferences["language"].should_not be_blank
      User.last.preferences["currency"].should_not be_blank
    end
  end


  describe "happy path" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    after :each do
      @user.destroy if @user
    end

    describe "index" do
      it "should show a list of users" do
        get :index
        response.should be_success
        assigns(:users).should_not be_blank
      end
    end

    describe "show" do
      it "should show the user specified" do
        get :show, :id => @user.id
        response.should be_success
        assigns(:user).should_not be_blank
      end
    end

    describe "edit" do
      it "should show the edit form" do
        get :edit, :id => @user.id
        response.should be_success
        assigns(:user).should_not be_blank
      end
    end

    describe "new" do
      it "should show the new form" do
        get :new
        response.should be_success
        assigns(:user).should be_new_record
      end
    end

    describe "create" do
      before :each do
        @new_user = FactoryGirl.build(:user)
      end

      after :each do
        @new_user.destroy
      end

      it "should create a new user object" do
        lambda {
          post :create, :user => @new_user.attributes
          response.should redirect_to User.last
        }.should change(User, :count).by(1)
      end
    end

    describe "update" do
      it "should update a user object" do
        lambda {
          put :update, :id => @user.id, :user => @user.attributes
          response.should redirect_to @user
        }.should_not change(User, :count)
      end
    end

    describe "destroy" do
      it "should destroy a user object" do
        lambda {
          delete :destroy, :id => @user.id
          response.should redirect_to root_path
        }.should change(User, :count).by(-1)
      end
    end
  end
end
