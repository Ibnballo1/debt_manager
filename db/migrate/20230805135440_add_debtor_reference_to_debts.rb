class AddDebtorReferenceToDebts < ActiveRecord::Migration[7.0]
  def change
    add_reference :debts, :debtor, null: false, foreign_key: true
  end
end
