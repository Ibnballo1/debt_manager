class DebtorsController < ApplicationController
  before_action :set_user, only: [:index]
  # before_action :set_debtor, only: [:show, :edit, :update, :destroy]

  def index
    @debtors = @user.debtors
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # private
  def set_user
    @user = User.find(params[:user_id])
  end
end
