class Debt < ApplicationRecord
  belongs_to :user
  has_many :debt_details

  validates :debtor, presence: true, length: { minimum: 3, maximum: 100 }

  def due_day(debt_date, due_date)
    date_of_debt = debt_date.to_date
    exp_day = (due_date - date_of_debt).to_i
    exp_day < 1 ? "Your Debt is due" : "Due: in #{exp_day} Days"
  end
end
