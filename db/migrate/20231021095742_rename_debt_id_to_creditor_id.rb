class RenameDebtIdToCreditorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :debt_details, :debt_id, :creditor_id
  end
end
