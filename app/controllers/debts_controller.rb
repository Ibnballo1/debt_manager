class DebtsController < ApplicationController
  before_action :set_debtor, only: [:index]
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  def index
    @debts = @debtor.debts
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
      redirect_to user_debts_path(user_id: @debt.user_id), notice: "Debt was successfully created."
    else
      render :new
    end
  end

  # edit debt
  def edit
    @debt
  end

  # Update user
  def update
    if @debt.update(debt_params)
      redirect_to user_debts_path(user_id: @debt.user_id), notice: "Debt was successfully created."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @debt.destroy
    redirect_to user_debts_path
  end

  private
  def set_debtor
    @debtor = Debtor.find(params[:debtor_id])
  end

  def set_debt
    @debt = Debt.find(params[:id])
  end

  def debt_params
    params.require(:debt).permit(:debtor, :due_date, :amount, :is_paid).merge(user_id: params[:user_id])
  end
end
