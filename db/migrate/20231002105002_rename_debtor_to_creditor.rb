class RenameDebtorToCreditor < ActiveRecord::Migration[7.0]
  def change
    rename_column :debts, :debtor, :creditor
  end
end
