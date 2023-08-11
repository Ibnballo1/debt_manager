class RemoveUserIdFromDebts < ActiveRecord::Migration[7.0]
  def change
    remove_column :debts, :user_id, :integer
  end
end
