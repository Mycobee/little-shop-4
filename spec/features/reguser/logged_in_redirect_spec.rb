require 'rails_helper'

RSpec.describe 'Logged in redirect works correctly' do
  context 'As a regular user and I visit login path' do
    it 'it redirects me to my profile page' do

      reg_user = create(:user)

      visit root_path

      click_link "Login"

      expect(current_path).to eq(login_path)

      fill_in "Email", with: "#{reg_user.email}"
      fill_in "Password", with: "#{reg_user.password}"

      click_button "Log In"

      visit login_path
      
      expect(current_path).to eq(profile_path(reg_user))
    end
  end
end
