require 'rails_helper'

describe 'the sign_in process', type: :feature do
  before :each do
    User.create(name: 'User1', email: 'user1@gmail.com', password: '123456')
  end

  it 'signs me in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    # save_and_open_page
    expect(current_path).to eq(debts_path)
    expect(page).to have_text(/Signed in successfully/)
  end
end