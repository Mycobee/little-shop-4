require 'rails_helper'

RSpec.describe 'Logged in redirect works correctly' do
  context 'As a regular user and I visit login path' do
    it 'it redirects me to my profile page' do

      reg_user = create(:user)

      visit login_path

      fill_in "Email", with: "#{reg_user.email}"
      fill_in "Password", with: "#{reg_user.password}"

      click_button "Log In"

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Logged in as #{reg_user.name}")
      expect(page).to_not have_link("Login")
      expect(page).to_not have_link("Register")

    end
  end
  context 'As a merchant user and I visit login path' do
    it 'it redirects me to my profile page' do

      merch_user = create(:merchant)

      visit login_path

      fill_in "Email", with: "#{merch_user.email}"
      fill_in "Password", with: "#{merch_user.password}"

      click_button "Log In"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{merch_user.name}")
      expect(page).to_not have_link("Login")
      expect(page).to_not have_link("Register")
      expect(page).to_not have_link("Shopping Cart")
    end
  end
  context 'As an admin user and I visit login path' do
    it 'it redirects me to my profile page' do

      admin_user = create(:admin)

      visit login_path

      fill_in "Email", with: "#{admin_user.email}"
      fill_in "Password", with: "#{admin_user.password}"

      click_button "Log In"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Logged in as #{admin_user.name}")
      expect(page).to_not have_link("Login")
      expect(page).to_not have_link("Register")
      expect(page).to_not have_link("Shopping Cart")
    end
  end
end
