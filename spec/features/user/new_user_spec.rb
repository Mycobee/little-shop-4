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

  describe 'sad path' do
    it 'should fail with invalid/no information' do
      visit new_user_path
      # leave form empty
      click_button 'Create User'


      expect(current_path).to eq(users_path)
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Zip code can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end

    it 'should fail with pre existing email' do
      email = 'deonte@turing.io'
      user = create(:user, email: email)
      visit root_path

      click_link 'Register'

      expect(current_path).to eq(new_user_path)

      fill_in 'Name', with: 'Deonte'
      fill_in 'Email', with: email
      fill_in 'Address', with: '189 E Belleview ln'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'CO'
      fill_in 'Zip code', with: '80015'
      fill_in 'Password', with: 'password'
      fill_in 'Confirm password', with: 'password'

      click_button 'Create User'

      expect(page).to have_content("Email has already been taken")
    end
  end
end
