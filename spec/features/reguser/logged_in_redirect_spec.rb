require 'rails_helper'

RSpec.describe 'Logged in redirect works correctly' do
  context 'As a regular user and I visit login path' do
    it 'it redirects me to my profile page' do

      reg_user = create(:user)

      visit root_path

      visit login_path

      expect(current_path).to eq(profile_path(reg_user))
    end
  end
  context 'As a regular user and I visit login path' do
    it 'it redirects me to my profile page' do

      reg_user = create(:user)

      visit root_path

      visit login_path

      expect(current_path).to eq(profile_path(reg_user))
    end
  end
  context 'As a merchant user and I visit login path' do
    it 'it redirects me to my profile page' do

      merch_user = create(:merchant)

      visit root_path

      visit login_path

      expect(current_path).to eq(merchant_dashboard_path(merch_user))
    end
  end
end
