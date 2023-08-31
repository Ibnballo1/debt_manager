require 'rails_helper'

RSpec.describe Debt, type: :model do
  let(:user) {User.new(name: 'Abdullateef', email: 'user1@gmail.com', password: '123456')}
  let(:debt) {Debt.new}

  it 'should not be valid without a debtor' do
    debt.debtor = nil
    expect(debt).to_not be_valid
  end

  it 'should not be valid with a short debtor' do
    debt.debtor = 'az'
    expect(debt).to_not be_valid
  end

  it 'should not be valid with a longer debtor' do
    debt.debtor = 'az' * 101
    expect(debt).to_not be_valid
  end

  it 'should not be valid without due_date' do
    debt.due_date = nil
    expect(debt).to_not be_valid
  end

  it 'should not be valid without an amount' do
    debt.amount = nil
    expect(debt).to_not be_valid
  end

  it 'should not be valid if amount <= 0' do
    debt.amount = -1
    expect(debt).to_not be_valid
  end
end