class CreateDebts < ActiveRecord::Migration[7.0]
  def change
    create_table :debts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :debtor
      t.date :due_date
      t.decimal :amount
      t.boolean :is_paid

      t.timestamps
    end
  end
end
