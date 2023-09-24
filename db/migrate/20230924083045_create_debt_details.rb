class CreateDebtDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :debt_details do |t|
      t.decimal :amount
      t.date :due_date
      t.boolean :is_paid
      t.text :reason
      t.references :debt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
