class ChangeCurrencyDataTypeInCreditors < ActiveRecord::Migration[7.0]
  def change
    change_column :creditors, :currency, :string
  end
end
