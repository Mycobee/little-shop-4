require 'rails_helper'

RSpec.describe 'registration' do
  it 'should succeed with valid information' do
    email = 'deonte@turing.io'

    visit root_path

    click_link 'Register'

    expect(current_path).to eq(new_user_path)
    fill_in 'Name', with: 'Deonte'
    fill_in 'Address', with: '189 E Belleview ln'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip code', with: '80015'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'

    click_button 'Create User'

    last_user = User.last
    expect(page).to have_content("Account successfully created, Logged in as #{last_user.name}")
    expect(last_user.email).to eq(email)
    expect(page).to have_content("Welcome, #{last_user.name}")
  end
end
