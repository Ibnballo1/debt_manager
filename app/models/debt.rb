class Debt < ApplicationRecord
  belongs_to :creditor

  validates :due_date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  # To get the sum of all amounts for a particular creditor
  def self.total_amount(creditor_id)
    where(creditor_id: creditor_id).sum(:amount)
  end

  def default_reason(reason)
    (reason == nil) ? reason = 'Add a reason for your debt' : reason
  end
end
