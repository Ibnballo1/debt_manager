class Debt < ApplicationRecord
  belongs_to :debtor

  validates :debtor, presence: true, length: { minimum: 3, maximum: 100 }
  validates :due_date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
