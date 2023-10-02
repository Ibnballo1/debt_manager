class DebtsController < ApplicationController
  load_and_authorize_resource
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  def index
    @debts = Debt.all
  end

  # method to create new user
  def new
    @debt = Debt.new
    @debt.debt_details.build
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
      puts "Not saved"
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
      redirect_to debts_path(), notice: "Debt was successfully updated."
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
    params.require(:debt).permit(:creditor, debt_details_attributes: [:amount, :due_date, :reason, :is_paid]).merge(user_id: current_user.id)
  end
end
