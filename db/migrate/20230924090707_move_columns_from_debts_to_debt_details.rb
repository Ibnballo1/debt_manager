class MoveColumnsFromDebtsToDebtDetails < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO debt_details (amount, due_date, is_paid, debt_id, created_at, updated_at)
      SELECT amount, due_date, is_paid, id, NOW(), NOW() FROM debts
    SQL

    # Remove columns from debts
    remove_column :debts, :amount
    remove_column :debts, :due_date
    remove_column :debts, :is_paid
  end

  def down
    add_column :debts, :amount, :decimal
    add_column :debts, :due_date, :date
    add_column :debts, :is_paid, :boolean

    # Copy data from debt_details to debts (this assumes no data conflicts)
    execute <<-SQL
      INSERT INTO debts (amount, due_date, is_paid, created_at, updated_at)
      SELECT amount, due_date, is_paid, created_at, updated_at FROM debt_details
    SQL

    # Remove columns from debt_details
    remove_column :debt_details, :amount
    remove_column :debt_details, :due_date
    remove_column :debt_details, :is_paid
  end
end
