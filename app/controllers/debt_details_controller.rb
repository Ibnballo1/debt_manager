class DebtDetailsController < ApplicationController
  load_and_authorize_resource
  before_action :set_debt, only: [:show, :edit, :update, :destroy]
  before_action :set_debt_detail, only: [:show, :edit, :update, :destroy]

  def index
    @debt_id = params[:id]

    if @debt_id
      @debt = Debt.find_by(id: @debt_id)
      @debt_details = DebtDetail.includes(:debt).where(debt_id: @debt_id)
    end
  end

  # method to create new user
  def new
    @debt_detail = DebtDetail.new
  end

  # method to show new user
  def show
    @debt_detail
  end

  # create debt
  def create
    @debt_detail = DebtDetail.new(debt_detail_params)
  
    if @debt_detail.save
      redirect_to debt_details_path(), notice: "Debt was successfully created."
    else
      render :new
    end
  end

  # edit debt
  def edit
    @debt_detail
  end

  # Update user
  def update
    if @debt_detail.update(debt_detail_params)
      redirect_to debt_details_path(), notice: "Debt was successfully updated."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @debt_detail.destroy
    redirect_to debt_details_path
  end

  private

  def set_debt
    @debt = Debt.find(params[:id])
  end

  def set_debt_detail
    @debt_detail = DebtDetail.find(params[:id])
  end

  def debt_detail_params
    params.require(:debt_detail).permit(:due_date, :amount, :is_paid, :reason, debts_attributes: [:debtor])
  end
end
