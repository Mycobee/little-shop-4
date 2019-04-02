require 'rails_helper'

RSpec.describe 'As a merchant user' do
  describe 'I see the same links as a visitor' do
    it 'minus login/cart, plus dashboard/ logout' do

      merchant = User.create(name: "Merchant 1", email: "merchant123@merchant.com", password_digest: "merch22", address: "213 merchant st", city: "Merchantsville", state: "Michigan", zip_code: 11123, role: 1, enabled: true)

      visit root_path

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
      expect(page).to have_link("#{merchant.name} Dashboard")
      expect(page).to have_link("Log Out")

      click_link 'Home'

      expect(current_path).to eq(root_path)

      click_link 'Items'
      expect(current_path).to eq(items_path)

      click_link 'Merchants'
      expect(current_path).to eq(merchants_path)

      click_link "#{merchant.name} Dashboard"
      expect(path).to eq(dashboard_path(merchant))

      click_link 'Logout'
      expect(path).to eq(logout_path)
    end
  end
end
