require 'rails_helper'

RSpec.describe 'As all registered users' do
    describe 'When i visit the logout path' do
        it 'redirects user to the root path' do
            reg_user = create(:user)
            visit login_path

            fill_in 'Email', with: reg_user.email
            fill_in 'Password', with: reg_user.password
            click_button("Log In")
            expect(current_path).to eq(profile_path)
            click_link("Log Out")
            expect(current_path).to eq(root_path)
            expect(page).to have_content("You are logged out")
        end

        it 'redirects merchant to the root path' do
            merchant = create(:merchant)
            visit login_path

            fill_in 'Email', with: merchant.email
            fill_in 'Password', with: merchant.password
            click_button("Log In")
            expect(current_path).to eq(merchant_dashboard_path)
            click_link("Log Out")
            expect(current_path).to eq(root_path)
            expect(page).to have_content("You are logged out")
        end

        it 'redirects admin to the root path' do
            admin = create(:admin)
            visit login_path

            fill_in 'Email', with: admin.email
            fill_in 'Password', with: admin.password
            click_button("Log In")
            expect(current_path).to eq(admin_dashboard_path)
            click_link("Log Out")
            expect(current_path).to eq(root_path)
            expect(page).to have_content("You are logged out")
        end
        #COME BACK TO REST OF THIS STORY WHEN SHOPPING CART IS BUILT
    end
end
