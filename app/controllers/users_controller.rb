class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # def show
  #   @user
  # end

  # private
  # def set_user
  #   @user = User.find(params[:id])
  # end
end
