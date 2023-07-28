class DebtsController < ApplicationController
  before_action :set_user, only: [:index, :show]
  before_action :set_debtor, only: [:show]
  def index
    @debts = @user.debts
  end

  # method to create new user
  def new
  end

  # method to show new user
  def show
    @debt
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
    @user = User.find(params[:user_id])
  end

  def set_debtor
    @debt = Debt.find(params[:id])
  end
end
