class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  def index
    @debts = Debt.all
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
      redirect_to debts_path(), notice: "Debt was successfully created."
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
      redirect_to debts_path(), notice: "Debt was successfully created."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @debt.destroy
    redirect_to debts_path
  end

  private

  def set_debt
    @debt = Debt.find(params[:id])
  end

  def debt_params
    params.require(:debt).permit(:debtor, :due_date, :amount, :is_paid)
  end
end
