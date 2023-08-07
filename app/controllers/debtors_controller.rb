class DebtorsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_debtor, only: [:show, :edit, :update, :destroy]

  def index
    @debtors = @user.debtors
  end

  def show
  end

  def new
    @debtor = Debtor.new
  end

  def create
    @debtor = Debtor.new(debtor_params)
  
    if @debtor.save
      redirect_to user_debtors_path(user_id: @debtor.user_id), notice: "Debt was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @debtor.destroy
    redirect_to user_debtors_path
  end

  # private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_debtor
    @debtor = Debtor.find(params[:id])
  end

  def debtor_params
    params.require(:debtor).permit(:name).merge(user_id: params[:user_id])
  end
end
