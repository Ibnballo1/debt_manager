class DebtsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_creditor, only: [:show]
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  def index
    @creditor_id = params[:id]

    if @creditor_id
      @creditor = Creditor.find_by(id: @creditor_id)
      @debts = Debt.includes(:creditor).where(creditor_id: @creditor_id)
    end
  end

  # method to create new user
  def new
    @creditor_id = params[:id]

    if @creditor_id
      @creditor = Creditor.find_by(id: @creditor_id)
      if @creditor
        @debt = @creditor.debts.build # Build a new debt associated with the creditor
      else
        redirect_to creditors_path, alert: "Creditor not found."
      end
    else
      redirect_to creditors_path, alert: "Missing creditor ID."
    end
  end

  # method to show new user
  def show
    @debt
  end

  # create debt
  def create
    @debt = Deb.new(debt_params)
  
    if @debt.save
      redirect_to creditors_path, notice: "Debt was successfully created."
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
      redirect_to debts_path(id: @debt.creditor_id), notice: "Debt was successfully updated."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @debt.destroy
    redirect_to debts_path(id: @debt.creditor_id)
  end

  private

  def set_creditor
    @creditor = Creditor.find(params[:id])
  end

  def set_debt
    @debt = Debt.find(params[:id])
  end

  def debt_params
    params.require(:debt).permit(:due_date, :amount, :reason, :is_paid, :creditor_id)
  end
end
