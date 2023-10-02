class DebtDetail < ApplicationRecord
  belongs_to :debt

  validates :due_date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  def self.total_amount(debt_id)
    where(debt_id: debt_id).sum(:amount)
  end

  def default_reason(reason)
    (reason == nil) ? reason = 'Add a reason for your debt' : reason
  end
end
