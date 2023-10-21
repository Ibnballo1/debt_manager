class RenameDebtsToCreditors < ActiveRecord::Migration[7.0]
  def change
    rename_table :debts, :creditors
  end
end
