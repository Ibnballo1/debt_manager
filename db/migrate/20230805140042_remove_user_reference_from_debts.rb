class RemoveUserReferenceFromDebts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :debts, :user, null: false, foreign_key: true
  end
end
