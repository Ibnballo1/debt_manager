class DebtDetailsController < ApplicationController
  load_and_authorize_resource
  before_action :set_debt_detail, only: [:show, :edit, :update, :destroy]

  def index
    @debt_details = DebtDetail.all
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
      redirect_to debts_path(), notice: "Debt was successfully created."
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
      redirect_to debts_path(), notice: "Debt was successfully updated."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @debt_detail.destroy
    redirect_to debts_path
  end

  private

  def set_debt_detail
    @debt_detail = DebtDetail.find(params[:id])
  end

  def debt_detail_params
   params.require(:debt_detail).permit(:due_date, :amount, :is_paid, :reason).merge(user_id: current_user.id)
  end
end
