class AddDefaultToIsPaidInDebtDetails < ActiveRecord::Migration[7.0]
  def change
    change_column :debt_details, :is_paid, :boolean, default: false
  end
end
