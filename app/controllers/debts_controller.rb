class DebtsController < ApplicationController
  before_action :set_debtor, only: [:index, :new, :edit, :update]
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  def index
    @debt = Debt.find(params[:debtor_id])
    @debts = @debtor.debts
  end

  # method to create new user
  def new
    @debtor = Debtor.find(params[:debtor_id])
    @debt = @debtor.debts.build
  end

  # method to show new user
  def show
    @debt
  end

  # create debt
  def create
    @debtor = Debtor.find(params[:debtor_id])
    @debt = @debtor.debts.build(debt_params)
  
    if @debt.save
      redirect_to user_debtor_debts_path(user_id: @debtor.user_id, debtor_id: @debtor.id), notice: "Debt was successfully created."
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
      redirect_to user_debtor_debts_path(user_id: @debtor.user_id, debtor_id: @debt.debtor_id), notice: "Debt was successfully created."
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
    params.require(:debt).permit(:due_date, :amount, :is_paid, :reason).merge(debtor_id: params[:debtor_id])
  end
end
