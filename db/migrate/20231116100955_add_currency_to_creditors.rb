class AddCurrencyToCreditors < ActiveRecord::Migration[7.0]
  def change
    add_column :creditors, :currency, :text
  end
end
