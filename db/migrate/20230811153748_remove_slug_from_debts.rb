class RemoveSlugFromDebts < ActiveRecord::Migration[7.0]
  def change
    remove_column :debts, :slug, :string
  end
end
