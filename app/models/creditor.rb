class Creditor < ApplicationRecord
  belongs_to :user
  has_many :debts
  accepts_nested_attributes_for :debts

  validates :creditor, presence: true, length: { minimum: 3, maximum: 100 }

  def due_day(debt_date, due_date)
    date_of_debt = debt_date.to_date
    exp_day = (due_date - date_of_debt).to_i
    exp_day < 1 ? "Your Debt is due" : "Due: in #{exp_day} Days"
  end
end
