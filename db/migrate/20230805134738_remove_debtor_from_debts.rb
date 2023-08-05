class RemoveDebtorFromDebts < ActiveRecord::Migration[7.0]
  def change
    remove_column :debts, :debtor, :string
  end
end
