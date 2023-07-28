class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = User.all
  end

  # method to create new user
  def new
  end

  # method to show new user
  def show
    @user
  end

  # edit user
  def edit
  end

  # Update user
  def update
  end

  # Destroy user
  def delete
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
