class Debt < ApplicationRecord
  belongs_to :debtor

  validates :reason, presence: true
  validates :due_date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
