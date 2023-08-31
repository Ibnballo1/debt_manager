require 'rails_helper'

RSpec.describe 'Debts', type: :feature do
  before :each do
    User.create(name: 'User1', email: 'user1@gmail.com', password: '123456')
  end

  it 'creates a new debt' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit new_debt_path
    fill_in 'Debtor', with: 'John Doe'
    fill_in 'Due date', with: '2023-09-30'
    fill_in 'Amount', with: '1000'
    click_button 'Add Debt'

    expect(page).to have_text('Debt was successfully created.')
  end
end
