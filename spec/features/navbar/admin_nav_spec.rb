require 'rails_helper'

RSpec.describe 'As an admin user' do
  describe 'I see the same links as a visitor' do
    it 'plus dashboard view, and logout link' do

      admin =  create(:admin)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)

      visit root_path

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
      expect(page).to have_link("Dashboard")
      expect(page).to have_link("Log Out")

      # click_link 'Home'
      #
      # expect(current_path).to eq(root_path)
      #
      # click_link 'Items'
      # expect(current_path).to eq(items_path)
      #
      # click_link 'Merchants'
      # expect(current_path).to eq(merchants_path)
      #
      # click_link "#{admin.name} Dashboard"
      # expect(path).to eq(admin_dashboard_path(admin))
      #
      # click_link 'Logout'
      # expect(path).to eq(logout_path)
    end
  end
end
