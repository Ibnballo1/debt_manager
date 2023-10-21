class RenameDebtDetailToDebt < ActiveRecord::Migration[7.0]
  def change
    rename_table :debt_details, :debts
  end
end
