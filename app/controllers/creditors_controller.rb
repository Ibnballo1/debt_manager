class CreditorsController < ApplicationController
  load_and_authorize_resource
  before_action :set_creditor, only: [:show, :edit, :update, :destroy]

  def index
    @creditors = Creditor.all
  end

  # method to create new user
  def new
    @creditor = Creditor.new
    @creditor.debts.build
  end

  # method to show new user
  def show
    @creditor
  end

  # create debt
  def create
    @creditor = Creditor.new(creditor_params)
  
    if @creditor.save
      redirect_to creditors_path(), notice: "Creditor was successfully created."
    else
      render :new
    end
  end

  # edit debt
  def edit
    @creditor
  end

  # Update user
  def update
    if @creditor.update(creditor_params)
      redirect_to creditors_path(), notice: "Creditor was successfully updated."
    else
      render :edit
    end
  end

  # Destroy user
  def destroy
    @creditor.destroy
    redirect_to creditors_path
  end

  private

  def set_creditor
    @creditor = Creditor.find(params[:id])
  end

  def creditor_params
    params.require(:creditor).permit(:creditor, debts_attributes: [:amount, :due_date, :reason, :is_paid]).merge(user_id: current_user.id)
  end
end
