class DebtDetailsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_creditor, only: [:show]
  before_action :set_debt_detail, only: [:show, :edit, :update, :destroy]

  def index
    @creditor_id = params[:id]

    if @creditor_id
      @creditor = Creditor.find_by(id: @creditor_id)
      @debt_details = DebtDetail.includes(:creditor).where(creditor_id: @creditor_id)
    end
  end

  # method to create new user
  def new
    @creditor_id = params[:id]

    if @creditor_id
      @creditor = Creditor.find_by(id: @creditor_id)
      if @creditor
        @debt_detail = @creditor.debt_details.build # Build a new debt_detail associated with the creditor
      else
        redirect_to creditors_path, alert: "Creditor not found."
      end
    else
      redirect_to creditors_path, alert: "Missing creditor ID."
    end
  end

  # method to show new user
  def show
    @debt_detail
  end

  # create debt
  def create
    @debt_detail = DebtDetail.new(debt_detail_params)
  
    if @debt_detail.save
      redirect_to creditors_path, notice: "Debt was successfully created."
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
      redirect_to debt_details_path(id: @debt_detail.creditor_id), notice: "Debt was successfully updated."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @debt_detail.destroy
    redirect_to debt_details_path(id: @debt_detail.creditor_id)
  end

  private

  def set_creditor
    @creditor = Creditor.find(params[:id])
  end

  def set_debt_detail
    @debt_detail = DebtDetail.find(params[:id])
  end

  def debt_detail_params
    params.require(:debt_detail).permit(:due_date, :amount, :reason, :is_paid, :creditor_id)
  end
end
