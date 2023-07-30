class DebtsController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :create]
  before_action :set_debt, only: [:show]

  def index
    @debts = @user.debts
  end

  # method to create new user
  def new
    @debt = Debt.new
  end

  # method to show new user
  def show
    @debt
  end

  # create debt
  def create
    @debt = Debt.new(debt_params)
  
    if @debt.save
      puts "In the create @debt is #{@debt}"
      redirect_to user_debts_path(user_id: @debt.user_id), notice: "Debt was successfully created."
    else
      puts "new debt not created"
      render :new
    end
  end

  # edit debt
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

  def set_debt
    @debt = Debt.find(params[:id])
  end

  def debt_params
    params.require(:debt).permit(:debtor, :due_date, :amount).merge(user_id: params[:user_id])
  end
end
