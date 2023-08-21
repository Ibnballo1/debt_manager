class Debt < ApplicationRecord
  belongs_to :user

  validates :debtor, presence: true, length: { minimum: 3, maximum: 100 }
  validates :due_date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  def due_day(debt_date, due_date)
    date_of_debt = debt_date.to_date
    exp_day = (due_date - date_of_debt).to_i
    if exp_day < 1
      return "Your Debt is due"
    else
      return "Due: in #{exp_day} Days"
    end
  end
end
