class AddSlugToDebts < ActiveRecord::Migration[7.0]
  def change
    add_column :debts, :slug, :string
    add_index :debts, :slug, unique: true
  end
end
