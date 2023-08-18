class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  # method to create new user
  def new
    @user = User.new
  end

  # method to show new user
  def show
    @user = current_user
  end

  # create user
  def create
    @user = User.new(user_params)
  
    if @user.save
      redirect_to user_path(@user), notice: "User was successfully created."
    else
      render :new
    end
  end

  # edit user
  def edit
    @user = current_user
  end

  # Update user
  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully created."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @user.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
