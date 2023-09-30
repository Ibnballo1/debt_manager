class DebtDetail < ApplicationRecord
  belongs_to :debt
  accepts_nested_attributes_for :debt
  # @@sum = 0

  validates :due_date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  # def total_debt_amount(amt)
  #   @@sum += amt
  # end

  def default_reason(reason)
    (reason == nil) ? reason = 'Add a reason for your debt' : reason
  end
end
