class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid? and @user.save
      redirect_to @user, :flash => { :notice => t(:user_created) }
    else
      render :action => :new, :flash => { :error => t(:user_not_created) }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, :flash => { :notice => t(:user_updated) }
    else
      render :action => :new, :flash => { :error => t(:user_not_updated) }
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, :flash => { :notice => t(:user_destroyed) }
    else
      redirect_to @user, :flash => { :error => t(:user_not_destroyed) }
    end
  end

private

  def user_params
    params.require(:user).permit(:email, preferences: [:theme, :language, :currency])
  end

end