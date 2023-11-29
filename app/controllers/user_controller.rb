class UserController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    p = BCrypt::Password.create(params[:user][:password])
    # user = User.new(uid: params[:user][:uid], pass: p, age: params[:user][:age])
    # user.save
    # redirect_to users_path
    @user = User.new(uid: params[:user][:user_name], pass: p)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:user_name]).destroy
    redirect_to users_path
  end
end
