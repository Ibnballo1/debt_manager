class AddDefaultToIsPaidInDebts < ActiveRecord::Migration[7.0]
  def up
    change_column :debts, :is_paid, :boolean, default: false
  end

  def down
    change_column :debts, :is_paid, :boolean, default: nil
  end
end
